/*
The upload feature is in beta stage , the uploaded document will not be reflected in teh resource section
Done : The user uploaded file will be uploaded to supabase Bucket
To be done : Auto update the Postgres table on upload with the upload entry
*/

import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/core/widgets/snackbar_message.dart';
// import 'package:CampusCommunities/features/auth/repository/auth_repository.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/course_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/topic_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/repository/resource_repository.dart';
import 'package:CampusCommunities/features/mainapp/uploaddocument/view/widgets/pdf_picker.dart';
import 'package:CampusCommunities/features/mainapp/uploaddocument/view/widgets/upload_button.dart';
import 'package:CampusCommunities/utils/constants.dart';

class UploadDocumentPage extends StatefulWidget {
  const UploadDocumentPage({super.key});

  @override
  State<UploadDocumentPage> createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  final ResourceRepository resourceRepository = ResourceRepository();
  // final AuthRepository authRepository = AuthRepository();

  final List<int> semesters = [1, 2, 3, 4, 5, 6, 7, 8];
  List<CourseModel> courses = [];
  List<TopicModel> topics = [];

  int? selectedSemester;
  String? selectedCourse;
  String? selectedTopic;
  PlatformFile? pickedFile;

  Future<String> getUserName() async {
    final response = await authRepository.getCurrentUser();
    String currentUser = response!.userName;
    return currentUser;
  }

  void fetchCourses(int semesterId) async {
    final List<CourseModel> fetchedCourses =
        await resourceRepository.fetchCourseData(semesterId);
    setState(
      () {
        courses = fetchedCourses;
      },
    );
  }

  // Future<int> searchTopicId() async {
  //   final List<String> courseNames =
  //       await resourceRepository.fetchCourseNames(selectedSemester!);

  //   final int topicId = courseNames.indexOf('$selectedCourse');
  //   return topicId;
  // }

  void fetchTopics(int courseId) async {
    final response =
        await resourceRepository.fetchTopicData(courseId: courseId);
    setState(
      () {
        topics = response;
      },
    );
  }

  Future selectPdfFile() async {
    final result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        allowedExtensions: ['pdf'],
        type: FileType.custom);
    setState(
      () {
        pickedFile = result!.files.first;
      },
    );
  }

  // Future<void> updateTableonUpload(
  //     {required String publicUrl,
  //     required String pdfTitle,
  //     String uploadDate ='04/08/24',
  //     required int topicId}) async {
  //   final String userName = await getUserName();
  //   print(userName);
  //   await supabaseClient.from('pdf_notes').insert({
  //     'pdf_url': publicUrl,
  //     'pdf_title': pdfTitle,
  //     'uploaded_by': userName,
  //     'upload_date':uploadDate,
  //     'topic_id': topicId
  //   });
  // }

  void cleanFields() {
    setState(() {
      selectedSemester = null;
      selectedCourse = null;
      selectedTopic = null;
      pickedFile = null;
    });
  }

  Future<void> uploadPdfToStorage() async {
    if (pickedFile == null) {
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a file first')),
      );
      return;
    }

    try {
      final file = File(pickedFile!.path!);
      final fileName = pickedFile!.name;
      final path =
          '${selectedCourse!.replaceAll(' ', '-')}/pdf-notes/$fileName';
      await supabaseClient.storage
          .from('campus-communities')
          .upload(path, file);
      cleanFields();
      if (!mounted) return;
      Utils.showSnackbar(context, 'File Uploaded Succesfully',
          backgroundColor: Colors.green);
      Utils.showAlert(
        context,
        'Thank you for your Contribution',
        'The upload feature is in beta stage so your upload will not be shown in Resource section , The mantainers will have to manually update the resource section',
      );
      // String publicUrl =
      //     supabaseClient.storage.from('CampusCommunities').getPublicUrl(path);
      // final int topicId = await searchTopicId();
      // await updateTableonUpload(
      //     publicUrl: publicUrl, pdfTitle: fileName, topicId: topicId);
    } catch (error) {
      if (!mounted) return;
      Utils.showSnackbar(context, '$error', backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        leading: const BackButtonCustom(),
        title: Text(
          'Upload Document',
          style: GoogleFonts.roboto(
            color: ReplyAppColors.darkerText,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: ReplyAppColors.notWhite,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width / 12, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownMenu<int>(
                width: screenSize.width - 100,
                hintText: 'Semester',
                initialSelection: selectedSemester,
                dropdownMenuEntries: semesters
                    .map<DropdownMenuEntry<int>>(
                      (item) =>
                          DropdownMenuEntry<int>(label: '$item', value: item),
                    )
                    .toList(),
                onSelected: (value) {
                  fetchCourses(value!);
                  setState(
                    () {
                      selectedSemester = value;
                      selectedCourse = null;
                      selectedTopic = null;
                      topics = [];
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownMenu<String>(
                width: screenSize.width - 100,
                hintText: 'Course',
                initialSelection: selectedCourse,
                dropdownMenuEntries: courses
                    .map<DropdownMenuEntry<String>>(
                      (item) => DropdownMenuEntry<String>(
                          label: item.courseName, value: item.courseName),
                    )
                    .toList(),
                onSelected: (value) {
                  final selectedCourseModel = courses
                      .firstWhere((course) => course.courseName == value);
                  fetchTopics(selectedCourseModel.id);
                  setState(
                    () {
                      selectedCourse = value;
                      selectedTopic = null;
                      topics = [];
                    },
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownMenu<String>(
                width: screenSize.width - 100,
                hintText: 'Topic',
                initialSelection: selectedTopic,
                dropdownMenuEntries: topics
                    .map<DropdownMenuEntry<String>>(
                      (item) => DropdownMenuEntry<String>(
                          label: item.topicName, value: item.topicName),
                    )
                    .toList(),
                onSelected: (value) {
                  setState(
                    () {
                      selectedTopic = value;
                    },
                  );
                },
              ),
            ),
            PdfPicker(
              screenSize: screenSize,
              selectFile: selectPdfFile,
              pickedFile: pickedFile,
            ),
            const SizedBox(
              height: 50,
            ),
            UploadButton(
              buttonText: 'Upload',
              onButtonTap: () {
                uploadPdfToStorage();
              },
              buttonColor: ReplyAppColors.dismissibleBackground,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
