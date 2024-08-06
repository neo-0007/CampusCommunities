import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:svg_flutter/svg.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/auth/model/usermodel.dart';
import 'package:CampusCommunities/features/auth/repository/auth_repository.dart';
import 'package:CampusCommunities/features/mainapp/uploaddocument/view/pages/upload_document_page.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerHomepage extends StatefulWidget {
  const DrawerHomepage({super.key});

  @override
  createState() => _DrawerHomepageState();
}

class _DrawerHomepageState extends State<DrawerHomepage> {
  late Future<UserModel?> userData;

  @override
  void initState() {
    super.initState();
    userData = getCurrentUser();
  }

  Future<UserModel?> getCurrentUser() async {
    AuthRepository authRepository = AuthRepository();
    return await authRepository.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ReplyAppColors.nearlyWhite,
      width: 250,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          FutureBuilder<UserModel?>(
            future: userData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const UserAccountsDrawerHeader(
                  accountName: Text('Loading...'),
                  accountEmail: Text('Loading...'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(),
                  ),
                  decoration: BoxDecoration(
                      color: ReplyAppColors.dismissibleBackground),
                );
              } else if (snapshot.hasError) {
                return const UserAccountsDrawerHeader(
                  accountName: Text('Error'),
                  accountEmail: Text('Error'),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(),
                  ),
                  decoration: BoxDecoration(
                      color: ReplyAppColors.dismissibleBackground),
                );
              } else if (snapshot.hasData) {
                UserModel user = snapshot.data!;
                return UserAccountsDrawerHeader(
                  accountName: Text(
                    user.userName,
                    style:
                        GoogleFonts.roboto(color: ReplyAppColors.nearlyWhite),
                  ),
                  accountEmail: Text(
                    user.instituteName.toUpperCase(),
                    style: GoogleFonts.roboto(
                        color: ReplyAppColors.nearlyWhite,
                        fontWeight: FontWeight.bold),
                  ),
                  currentAccountPicture: const CircleAvatar(
                    child: ClipOval(
                        child: Icon(
                      Icons.person_2_rounded,
                      color: Colors.blue,
                      size: 60,
                    )),
                  ),
                  decoration: const BoxDecoration(
                      color: ReplyAppColors.dismissibleBackground),
                );
              } else {
                return const UserAccountsDrawerHeader(
                  accountName: Text('No User'),
                  accountEmail: Text(' '),
                  currentAccountPicture: CircleAvatar(
                    child: ClipOval(),
                  ),
                  decoration: BoxDecoration(
                      color: ReplyAppColors.dismissibleBackground),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading:
                SvgPicture.asset('assets/images/github-142-svgrepo-com.svg'),
            title: const Text('Contribute'),
            onTap: () {
                const githubRepoLink = 'https://github.com/neo-0007/CampusCommunities';
                launchUrl(Uri.parse(githubRepoLink),
                mode: LaunchMode.externalApplication);
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Contact Us'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () {
              AuthRepository authRepository = AuthRepository();
              authRepository.logout();
              Navigator.pushNamed(context, '/auth-start');
            },
          ),
          const Divider(),
          ListTile(
            // tileColor: ReplyAppColors.orange,
            leading: const Icon(Icons.upload_file_rounded),
            title: const Text('Upload Document'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UploadDocumentPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
