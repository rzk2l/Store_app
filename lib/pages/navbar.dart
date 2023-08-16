import 'package:first_attempt/controllers/bottom_navigation_controller.dart';
import 'package:first_attempt/pages/favs.dart';
import 'package:first_attempt/pages/home.dart';
import 'package:first_attempt/pages/search_bar.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());
  final MyColors myColorsInstance = MyColors();

  final List<Widget> screens = [
    HomeScreen(),
    SearchBarScreen(),
    FavoritesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (context) {
      return Scaffold(
        body: IndexedStack(
          index: bottomNavBarController.currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '')
          ],
          currentIndex: bottomNavBarController.currentIndex,
          elevation: 0,
          backgroundColor: myColorsInstance.bg,
          selectedItemColor: myColorsInstance.gsbg1,
          unselectedItemColor: myColorsInstance.iconbg,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 28,
          onTap: (index) {
            bottomNavBarController.changeIndex(index);
          },
        ),
      );
    });
  }
}
