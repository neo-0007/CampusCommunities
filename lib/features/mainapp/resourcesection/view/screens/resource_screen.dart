import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/models/course_model.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/repository/resource_repository.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/widgets/subject_block.dart';

class ResourceScreen extends StatefulWidget {
  final int semesterNo;
  const ResourceScreen({super.key, this.semesterNo = 1});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  List<CourseModel> courses = [];
  bool isLoading = true;
  ResourceRepository resourceRepository = ResourceRepository();

  @override
  void initState() {
    super.initState();
    getCourses();
  }

  void getCourses() async {
    final List<CourseModel> fetchedCourses =
        await resourceRepository.fetchCourseData(1);
    setState(() {
      courses = fetchedCourses;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: ReplyAppColors.notWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'SEMESTER ${widget.semesterNo}',
              style: GoogleFonts.workSans(
                  color: ReplyAppColors.darkerText,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : courses.isEmpty
                ? const Text('No Courses Found !')
                : ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) {
                      return SubjectBlock(
                        courseId: courses[index].id,
                        subjectName: courses[index].courseName,
                        courseCode: courses[index].courseCode,
                        credits: courses[index].credits,
                        topicCount: courses[index].topicCount,
                      );
                    },
                  ),
      ),
    );
  }
}
