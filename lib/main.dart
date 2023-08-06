import 'package:first_attempt/pages/home.dart';
import 'package:flutter/material.dart';
import 'services/colors.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (context) => GetStarted(),
    '/home': (context) => HomeScreen(),
  }));
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
              )),
              SizedBox(height: 30),
              Text(
                "Let's improve your style",
                style: TextStyle(
                    fontSize: 30,
                    color: myColorsInstance.bg,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              Text(
                "Find cool shoes to support your daily activities",
                style: TextStyle(
                    color: myColorsInstance.bg, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
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
