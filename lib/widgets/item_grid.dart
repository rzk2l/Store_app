import 'package:first_attempt/controllers/controller.dart';
import 'package:first_attempt/services/items.dart';
import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:get/get.dart';

class ItemsGrid extends StatelessWidget {
  ItemsGrid({super.key});

  final MyColors myColorsInstance = MyColors();
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.items.length,
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
                      controller.items[index].imageUrl,
                      fit: BoxFit.fitWidth,
                    )),
                SizedBox(height: 5),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.items[index].price,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          controller.items[index].name,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Obx(() => IconButton(
                        onPressed: () {
                          if (controller.items[index].isFav) {
                            GridItem item = controller.items[index];
                            item.isFav = false;
                            controller.items[index] = item;
                            controller.favItems.remove(controller.items[index]);
                          } else {
                            GridItem item = controller.items[index];
                            item.isFav = true;
                            controller.items[index] = item;
                            controller.favItems.add(controller.items[index]);
                          }
                        },
                        icon: (controller.items[index].isFav)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                              ))),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
