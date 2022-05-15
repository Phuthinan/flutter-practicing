import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'mainPage/activities_page.dart';
import 'mainPage/experience_page.dart';
import 'mainPage/home_page.dart';
import 'mainPage/project_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List page = [HomePage(), ExperiencePage(), ProjectPage(), ActivitiesPage()];
  int currentPage = 0;

  void changePage(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: "About"),
          BottomNavigationBarItem(
              icon: Icon(Icons.checklist), label: "Experience"),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: "Projects"),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessibility_new), label: "Activities"),
        ],
        onTap: changePage,
        currentIndex: currentPage,
        selectedItemColor: AppColors.mainColor,
        unselectedItemColor: AppColors.signColor,
        showUnselectedLabels: true,
        // elevation: 0,
      ),
    );
  }
}
