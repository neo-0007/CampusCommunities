import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class CgpaCourseCard extends StatefulWidget {
  final String cardTitle;
  final TextEditingController creditController;
  final TextEditingController sgpaController;
  final String firstHintText;
  final String secondHintText;
  const CgpaCourseCard({
    super.key,
    required this.cardTitle,
    required this.creditController,
    required this.sgpaController,
    required this.firstHintText,
    required this.secondHintText,
  });

  @override
  State<CgpaCourseCard> createState() => _SgpaCourseCardState();
}

class _SgpaCourseCardState extends State<CgpaCourseCard> {
  final List<int> credits = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      credits.add(i);
    }
  }

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
        trailing: SizedBox(
          width: screenSize.width / 3.5,
          child: TextField(
            controller: widget.sgpaController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: widget.secondHintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
