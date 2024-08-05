import 'package:flutter/material.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/pages/cgpa_calculator_page.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/pages/sgpa_page.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/widgets/calculator_option_button.dart';

class CalculatorOptionsPage extends StatelessWidget {
  const CalculatorOptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        leading: const BackButtonCustom(),
        backgroundColor: ReplyAppColors.notWhite,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CalculatorOptionButton(
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SgpaPage(),
                  ),
                );
              },
              buttonText: 'SGPA Calculator'),
          CalculatorOptionButton(
              onButtonPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CgpaCalculatorPage(),
                  ),
                );
              },
              buttonText: 'CGPA Calculator'),
          CalculatorOptionButton(
              onButtonPressed: () {}, buttonText: 'CGPA Estimator'),
        ],
      ),
    );
  }
}
