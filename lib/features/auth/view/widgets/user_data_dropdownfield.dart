import 'package:dropdownfield2/dropdownfield2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDataDropdownfield extends StatefulWidget {
  final List<String> dropdownList;
  final TextEditingController fieldController;
  final String hintText;
  final IconData icon;

  const UserDataDropdownfield(
      {super.key,
      required this.dropdownList,
      required this.fieldController,
      required this.hintText, 
      required this.icon});

  @override
  State<UserDataDropdownfield> createState() => _UserDataDropdownfieldState();
}

class _UserDataDropdownfieldState extends State<UserDataDropdownfield> {
  @override
  Widget build(BuildContext context) {
    return DropDownField(
      hintText: widget.hintText,
      hintStyle: GoogleFonts.workSans(fontSize: 17),
      enabled: true,
      required: true,
      itemsVisibleInDropdown: 2,
      controller: widget.fieldController,
      icon: Icon(widget.icon),
      items: widget.dropdownList,
    );
  }
}
