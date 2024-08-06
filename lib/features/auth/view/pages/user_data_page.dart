import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/snackbar_message.dart';
import 'package:CampusCommunities/features/auth/view/widgets/text_button.dart';
import 'package:CampusCommunities/features/auth/view/widgets/user_data_dropdownfield.dart';
import 'package:CampusCommunities/features/mainapp/main_page.dart';
import 'package:CampusCommunities/utils/constants.dart';

class UserDataPage extends StatefulWidget {
  final String userId;
  final String username;
  const UserDataPage({super.key, required this.userId, required this.username});

  @override
  State<UserDataPage> createState() => _UserDataPageState();
}

class _UserDataPageState extends State<UserDataPage> {
  List<String> institute = [
    'Tezpur University',
    'Jagannath Barooah University'
  ];
  List<String> departments = ['CSE', 'CE', 'ECE', 'ME', 'EE', 'FET'];
  List<String> semesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
  final selectedInstitute = TextEditingController();
  final selectedDepartment = TextEditingController();
  final selectedSemester = TextEditingController();
  final selectedRollNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        backgroundColor: ReplyAppColors.notWhite,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Personal Data',
              style: GoogleFonts.workSans(
                  color: ReplyAppColors.darkText,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(height: 40),
            UserDataDropdownfield(
              dropdownList: institute,
              fieldController: selectedInstitute,
              hintText: 'Institute',
              icon: Icons.school_rounded,
            ),
            const SizedBox(height: 20),
            UserDataDropdownfield(
              dropdownList: departments,
              fieldController: selectedDepartment,
              hintText: 'Department',
              icon: Icons.engineering_rounded,
            ),
            const SizedBox(height: 20),
            UserDataDropdownfield(
              dropdownList: semesters,
              fieldController: selectedSemester,
              hintText: 'Semester',
              icon: Icons.layers,
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                controller: selectedRollNumber,
                decoration: InputDecoration(
                  hintText: 'Roll No. (eg. format CSB23023)',
                  hintStyle: GoogleFonts.workSans(fontSize: 17),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 35,
                vertical: 0,
              ),
              child: LoginSignUpButton(
                buttonText: 'Lets Connect',
                onButtonTap: () async {
                  try {
                    await supabaseClient.from('accounts').insert({
                      'id': widget.userId,
                      'username': widget.username,
                      'institute': selectedInstitute.text,
                      'department': selectedDepartment.text,
                      'semester': int.parse(selectedSemester.text),
                      'roll_number': selectedRollNumber.text
                    });
                    if (!context.mounted) return;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                    Utils.showSnackbar(
                        context, 'Welcome to Campus Communites !',
                        backgroundColor: Colors.green);
                  } catch (e) {
                    Utils.showSnackbar(context, e.toString(),
                        backgroundColor: Colors.redAccent);
                  }
                },
                buttonColor: ReplyAppColors.dismissibleBackground,
                textColor: ReplyAppColors.nearlyWhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
