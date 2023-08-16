import 'package:first_attempt/controllers/bottom_navigation_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorsInstance.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
          child: Column(
            children: [
              SizedBox(height: 15),
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
    );
  }
}
