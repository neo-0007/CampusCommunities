import 'package:flutter/material.dart';
import 'package:CampusCommunities/features/mainapp/blogsection/view/pages/blog_screen.dart';
import 'package:CampusCommunities/core/widgets/bottom_gnav_bar.dart';
import 'package:CampusCommunities/features/mainapp/groupsection/pages/groups_screen.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/pages/home_screen.dart';
import 'package:CampusCommunities/features/mainapp/homesection/view/widgets/drawer_homepage.dart';
import 'package:CampusCommunities/features/mainapp/resourcesection/view/screens/resource_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  int _selectedIndex = 0;
  // static final List<Widget> _pages = [
  //   HomeScreen(),
  //   const ResourceScreen(),
  //   const BlogScreen(),
  //   const GroupsScreen()
  // ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerHomepage(),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(onDrawerOpen: _openDrawer),
          const ResourceScreen(),
          const BlogScreen(),
          const GroupsScreen()
        ],
      ),
      //  _pages[_selectedIndex],
      bottomNavigationBar: BottomGnavBar(
        currentScreenIndex: _selectedIndex,
        onTabChange: _onTabChanged,
      ),
    );
  }
}
