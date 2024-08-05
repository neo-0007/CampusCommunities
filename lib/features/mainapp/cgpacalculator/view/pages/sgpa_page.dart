import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';
import 'package:CampusCommunities/core/widgets/back_button_custom.dart';
import 'package:CampusCommunities/core/widgets/snackbar_message.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/repository/calculator_repository.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/widgets/calculate_button.dart';
import 'package:CampusCommunities/features/mainapp/cgpacalculator/view/widgets/sgpa_course_card.dart';

class SgpaPage extends StatefulWidget {
  const SgpaPage({super.key});

  @override
  State<SgpaPage> createState() => _SgpaPageState();
}

class _SgpaPageState extends State<SgpaPage> {
  final List<TextEditingController> _creditControllers = [];
  final List<TextEditingController> _gradeControllers = [];
  final CalculatorRepository calculatorService = CalculatorRepository();
  bool isCalculating = false;

  @override
  void initState() {
    super.initState();
    // Initializing controllers for 10 courses
    for (int i = 0; i < 10; i++) {
      _creditControllers.add(TextEditingController());
      _gradeControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    // Dispose all controllers
    for (var controller in _creditControllers) {
      controller.dispose();
    }
    for (var controller in _gradeControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  double _calculateSgpa() {
    // Retrieve credits and grades, then calculate SGPA
    List<int> credits = _creditControllers
        .map((controller) => int.tryParse(controller.text) ?? 0)
        .toList();
    List<String> grades =
        _gradeControllers.map((controller) => controller.text).toList();

    double sgpa = calculatorService.calculateSgpa(credits, grades);
    return sgpa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReplyAppColors.notWhite,
      appBar: AppBar(
        backgroundColor: ReplyAppColors.notWhite,
        leading: const BackButtonCustom(),
        title: Text(
          'SGPA Calculator',
          style: GoogleFonts.roboto(
              color: ReplyAppColors.darkerText, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SgpaCourseCard(
                    cardTitle: 'Course ${index + 1}',
                    creditController: _creditControllers[index],
                    gradeController: _gradeControllers[index],
                    firstHintText: 'Credits',
                    secondHintText: 'Grade',
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CalculateButton(
              onButtonPressed: () {
                double sgpa = _calculateSgpa();
                Utils.showAlert(context, 'SGPA', 'Your SGPA is $sgpa');
              },
              buttonText: 'Calculate')
        ],
      ),
    );
  }
}
