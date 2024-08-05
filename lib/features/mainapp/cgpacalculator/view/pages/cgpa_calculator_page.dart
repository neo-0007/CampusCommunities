import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/core/widgets/snackbar_message.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/repository/calculator_repository.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/widgets/calculate_button.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/widgets/cgpa_course_card.dart';

class CgpaCalculatorPage extends StatefulWidget {
  const CgpaCalculatorPage({super.key});

  @override
  State<CgpaCalculatorPage> createState() => _CgpaCalculatorPageState();
}

class _CgpaCalculatorPageState extends State<CgpaCalculatorPage> {
  final List<TextEditingController> _creditControllers = [];
  final List<TextEditingController> _sgpaControllers = [];
  final CalculatorRepository calculatorService = CalculatorRepository();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 8; i++) {
      _creditControllers.add(TextEditingController());
      _sgpaControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in _creditControllers) {
      controller.dispose();
    }
    for (var controller in _sgpaControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  double _calculateCgpa() {
    List<int> credits = _creditControllers
        .map(
          (credit) => int.tryParse(credit.text) ?? 0,
        )
        .toList();
    List<double> sgpas = _sgpaControllers
        .map(
          (sgpa) => double.tryParse(sgpa.text) ?? 0,
        )
        .toList();

    return calculatorService.calculateCgpa(credits, sgpas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        backgroundColor: ReplyAppColors.notWhite,
        leading: const BackButtonCustom(),
        title: Text(
          'CGPA Calculator',
          style: GoogleFonts.roboto(
              fontWeight: FontWeight.bold, color: ReplyAppColors.darkerText),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return CgpaCourseCard(
                      cardTitle: 'Semester ${index + 1}',
                      creditController: _creditControllers[index],
                      sgpaController: _sgpaControllers[index],
                      firstHintText: 'Credits',
                      secondHintText: 'SGPA');
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CalculateButton(
              onButtonPressed: () {
                double cgpa = _calculateCgpa();
                double roundedCgpa = double.parse(cgpa.toStringAsFixed(2));
                Utils.showAlert(context, 'CGPA', 'Your CGPA is $roundedCgpa');
              },
              buttonText: 'Calculate')
        ],
      ),
    );
  }
}
