/* import 'package:first_attempt/controllers/binding.dart';
import 'package:first_attempt/pages/favs.dart';
import 'package:first_attempt/pages/home.dart'; */
import 'package:first_attempt/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'services/colors.dart';
import 'dart:math';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.getGetStarted(),
    getPages: AppPages.routes,
    /* routes: {
    '/': (context) => GetStarted(),
    '/home': (context) => HomeScreen(),
  } */
  ));
}

class GetStarted extends StatelessWidget {
  GetStarted({super.key});

  final myColorsInstance = MyColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [myColorsInstance.gsbg1, myColorsInstance.gsbg2],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.7, 1],
            transform: GradientRotation(pi / 4),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                  image: NetworkImage(
                "https://static.thenounproject.com/png/2635332-200.png",
                scale: 0.8,
              )),
              SizedBox(height: 45),
              Text(
                "Let's improve your style",
                style: TextStyle(
                    fontSize: 30,
                    color: myColorsInstance.bg,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 20),
              Text(
                "Find cool shoes to support your daily activities",
                style: TextStyle(
                    color: myColorsInstance.bg, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 45),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed('/nav');
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(myColorsInstance.bg),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45, vertical: 18),
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 20,
                      color: myColorsInstance.fnt,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
