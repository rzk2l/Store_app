import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/widgets/pub_card.dart';
import 'package:first_attempt/widgets/logo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              PubCard(myColorsInstance: myColorsInstance),
              SizedBox(height: 20),
              LogoList(),
            ],
          ),
        ),
      ),
    );
  }
}
