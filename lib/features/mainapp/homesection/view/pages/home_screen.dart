import 'package:flutter/material.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/features/auth/repository/auth_repository.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/pages/calculator_options_page.dart';
// import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/drawer_homepage.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/institute_card.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/news_notifications_card.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/square_card.dart';
// import 'package:CampusCommunities/features/auth/view/widgets/text_button.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onDrawerOpen;
  HomeScreen({super.key, this.onDrawerOpen});

  final AuthRepository authRepository = AuthRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        backgroundColor: ReplyAppColors.notWhite,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              onDrawerOpen?.call();
            },
          );
        }),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: ReplyAppColors.nearlyWhite),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.person_2_rounded,
                    color: Colors.blue,
                  ),
                )),
          )
        ],
      ),
      // drawer: const DrawerHomepage(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              const InstituteCard(
                instituteImage:
                    'assets/images/Tezpur-University-Assam-Campus-View-1 crop.jpg',
                instituteName: 'TEZPUR UNIVERSITY',
              ),
              Container(
                height: 100,
                color: ReplyAppColors.transparentColor,
                width: double.infinity,
                child: Row(
                  children: [
                    SquareCard(
                      imagePath: 'assets/images/student-svgrepo-com.svg',
                      text: 'Students List',
                      onCardTap: () {},
                    ),
                    SquareCard(
                        imagePath: 'assets/images/calculator-svgrepo-com.svg',
                        text: 'CGPA Calculator',
                        onCardTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CalculatorOptionsPage(),
                            ),
                          );
                        }),
                    SquareCard(
                      imagePath: 'assets/images/verified-svgrepo-com.svg',
                      text: 'Admins',
                      onCardTap: () {},
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 500,
                width: double.infinity,
                child: NewsNotificationsCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//         child: LoginSignUpButton(
//             buttonText: 'Logout',
//             onButtonTap: () {
//               authRepository.logout();
//               Navigator.pushNamed(context,'/auth-start');
//             }),
//       ),