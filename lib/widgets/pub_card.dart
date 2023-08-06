import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/services/pub.dart';

class PubCard extends StatelessWidget {
  PubCard({
    super.key,
    required this.myColorsInstance,
  });

  final MyColors myColorsInstance;
  final PubInfo pubInfo = PubInfo(
      name: 'Nike. Just Do It',
      slogan: "A HERITAGE OF SPEED",
      logoPath: "nike_white.png");

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: myColorsInstance.gsbg1,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pubInfo.name,
                    style: TextStyle(
                      color: myColorsInstance.bg,
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    width: 200,
                    child: Text(
                      pubInfo.slogan,
                      style: TextStyle(
                          color: myColorsInstance.bg,
                          fontSize: 25,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: Image.asset(
                  pubInfo.logoPath,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
