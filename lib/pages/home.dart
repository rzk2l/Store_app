import 'package:first_attempt/controllers/bottom_navigation_controller.dart';
import 'package:first_attempt/pages/favs.dart';
import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/widgets/pub_card.dart';
import 'package:first_attempt/widgets/logo_list.dart';
import 'package:first_attempt/widgets/item_grid.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  BottomNavBarController bottomNavBarController =
      Get.put(BottomNavBarController());

  final myColorsInstance = MyColors();

  final List screens = [HomeScreen(), FavoritesScreen()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorsInstance.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
          child: Column(
            children: [
              PubCard(myColorsInstance: myColorsInstance),
              SizedBox(height: 20),
              LogoList(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Selected for you",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ItemsGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: '')
        ],
        //currentIndex: currentIndex,
        elevation: 0,
        backgroundColor: myColorsInstance.bg,
        selectedItemColor: myColorsInstance.gsbg1,
        unselectedItemColor: myColorsInstance.iconbg,
        iconSize: 28,
        onTap: (index) {
          /* setState(() {
            currentIndex = index;
          });
          if (currentIndex == 2) Get.toNamed('/favs'); */
        },
      ),
    );
  }
}
