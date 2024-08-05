import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class SgpaCourseCard extends StatefulWidget {
  final String cardTitle;
  final TextEditingController creditController;
  final TextEditingController gradeController;
  final String firstHintText;
  final String secondHintText;
  const SgpaCourseCard({
    super.key,
    required this.cardTitle,
    required this.creditController,
    required this.gradeController,
    required this.firstHintText,
    required this.secondHintText,
  });

  @override
  State<SgpaCourseCard> createState() => _SgpaCourseCardState();
}

class _SgpaCourseCardState extends State<SgpaCourseCard> {
  final List<int> credits = [0, 1, 2, 3, 4, 5, 6, 7, 8];
  final List<String> grade = ['O', 'A+', 'A', 'B+', 'B', 'C', 'P'];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: ListTile(
        leading: Text(
          widget.cardTitle,
          style: GoogleFonts.roboto(
            color: ReplyAppColors.darkerText,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        title: DropdownMenu(
          width: screenSize.width / 3.5,
          controller: widget.creditController,
          hintText: widget.firstHintText,
          dropdownMenuEntries: credits
              .map<DropdownMenuEntry<int>>(
                (e) => DropdownMenuEntry(value: e, label: '$e'),
              )
              .toList(),
        ),
        trailing: DropdownMenu(
          width: screenSize.width / 3.5,
          controller: widget.gradeController,
          hintText: widget.secondHintText,
          dropdownMenuEntries: grade
              .map<DropdownMenuEntry<String>>(
                (e) => DropdownMenuEntry(value: e, label: e),
              )
              .toList(),
        ),
      ),
    );
  }
}
