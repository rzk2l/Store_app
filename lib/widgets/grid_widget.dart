import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/services/items.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({
    super.key,
    required this.items,
    required this.myColorsInstance,
  });

  final List<GridItem> items;
  final MyColors myColorsInstance;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 215,
      ),
      itemBuilder: (context, index) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  height: 150,
                  color: myColorsInstance.itembg,
                  child: Image.asset(
                    items[index].imageUrl,
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(height: 5),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        items[index].price,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        items[index].name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
