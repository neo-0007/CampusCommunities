import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:CampusCommunities/core/theme/appcolors/app_colors.dart';

class BottomGnavBar extends StatefulWidget {
  final int currentScreenIndex;
  final void Function(int) onTabChange;
  const BottomGnavBar(
      {super.key, required this.currentScreenIndex, required this.onTabChange});

  @override
  State<BottomGnavBar> createState() => _BottomGnavBarState();
}

class _BottomGnavBarState extends State<BottomGnavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ReplyAppColors.dismissibleBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: GNav(
          backgroundColor: ReplyAppColors.dismissibleBackground,
          tabBackgroundColor: ReplyAppColors.nearlyWhite,
          padding: const EdgeInsets.all(16),
          gap: 2,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.menu_book_sharp,
              text: 'Resources',
            ),
            GButton(
              icon: Icons.library_books,
              text: 'Blogs',
            ),
            GButton(
              icon: Icons.group,
              text: 'Groups',
            )
          ],
          selectedIndex: widget.currentScreenIndex,
          onTabChange: widget.onTabChange,
        ),
      ),
    );
  }
}
