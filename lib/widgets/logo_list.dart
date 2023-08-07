import 'package:flutter/material.dart';
import 'package:first_attempt/services/logolist.dart';
import 'package:first_attempt/services/colors.dart';

class LogoList extends StatelessWidget {
  LogoList({super.key});

  final MyColors myColorsInstance = MyColors();

  final List<ListOfLogos> logoList = [
    ListOfLogos(title: 'Nike', logoPath: 'nike_black.png'),
    ListOfLogos(title: 'Addidas', logoPath: 'adidas_black.png'),
    ListOfLogos(title: 'Puma', logoPath: 'puma_black.png'),
    ListOfLogos(title: 'Under Armor', logoPath: "ua_black.png"),
    ListOfLogos(title: "Asics", logoPath: "asics_black.png"),
    ListOfLogos(title: "New Balance", logoPath: "nb_black.png"),
    ListOfLogos(title: "Reebok", logoPath: "Reebok_black.png"),
    ListOfLogos(title: 'Nike', logoPath: 'nike_black.png'),
    ListOfLogos(title: 'Addidas', logoPath: 'adidas_black.png'),
    ListOfLogos(title: 'Puma', logoPath: 'puma_black.png'),
    ListOfLogos(title: 'Under Armor', logoPath: "ua_black.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: logoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: myColorsInstance.itembg,
                  radius: 30,
                  backgroundImage: AssetImage(logoList[index].logoPath),
                ),
                SizedBox(height: 7),
                SizedBox(
                  width: 60,
                  child: Text(
                    logoList[index].title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
