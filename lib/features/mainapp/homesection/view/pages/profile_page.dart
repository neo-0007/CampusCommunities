import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/user/currentuser.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/core/widgets/loader.dart';
import 'package:CampusCommunities/features/auth/model/usermodel.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/user_data_box.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/user_data_box_2.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/user_data_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Currentuser currentuser = Currentuser();
  UserModel? user;
  bool isLoading = true;

  @override
  void initState() {
    getUser();
    super.initState();
  }

  Future<void> getUser() async {
    final res = await currentuser.getCurrentUser();
    setState(() {
      user = res;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ReplyAppColors.notWhite,
        leading: const BackButtonCustom(),
      ),
      backgroundColor: ReplyAppColors.notWhite,
      body: isLoading
          ? const Center(
              child: Loader(),
            )
          : Padding(
              padding: EdgeInsets.fromLTRB(40, screenSize.height / 12, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundColor: ReplyAppColors.nearlyWhite,
                    child: Icon(
                      Icons.person_2_rounded,
                      color: Colors.blue,
                      size: 75,
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height / 9,
                  ),
                  UserDataBox(
                    topText: 'Name',
                    bottomText: user!.userName,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  UserDataBox(
                    topText: 'Institute',
                    bottomText: user!.instituteName,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  UserDataBox2(
                    department: user!.department,
                    semester: '${user!.semesterNo}',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: screenSize.width / 4.2,
                    child: UserDataButton(
                      buttonText: 'Edit',
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
