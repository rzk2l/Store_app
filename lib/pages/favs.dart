import 'package:first_attempt/controllers/controller.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/services/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({super.key});
  final Controller controller = Get.find();
  final MyColors myColorsInstance = MyColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myColorsInstance.bg,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
            child: Column(
              children: [
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Favorites",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Obx(() => (controller.favItems.isNotEmpty)
                    ? Expanded(
                        child: GridView.builder(
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: controller.favItems.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
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
                                        controller.favItems[index].imageUrl,
                                        fit: BoxFit.fitWidth,
                                      )),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.favItems[index].price,
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            controller.favItems[index].name,
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: SizedBox(),
                                      ),
                                      Obx(() => IconButton(
                                          onPressed: () {
                                            if (controller
                                                .favItems[index].isFav) {
                                              GridItem favItem =
                                                  controller.favItems[index];
                                              favItem.isFav = false;
                                              controller.favItems[index] =
                                                  favItem;
                                              controller.favItems.remove(
                                                  controller.favItems[index]);
                                              GridItem item =
                                                  controller.items[index];
                                              item.isFav = false;
                                              controller.items[index] = item;
                                            } else {
                                              GridItem favItem =
                                                  controller.favItems[index];
                                              favItem.isFav = true;
                                              controller.favItems[index] =
                                                  favItem;
                                              controller.favItems.add(
                                                  controller.favItems[index]);
                                              GridItem item =
                                                  controller.items[index];
                                              item.isFav = true;
                                              controller.items[index] = item;
                                            }
                                          },
                                          icon:
                                              (controller.favItems[index].isFav)
                                                  ? Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    )
                                                  : Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                    ))),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Expanded(
                        child: Center(
                          child: Text(
                            "No Favorites Yet!",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      )),
              ],
            ),
          ),
        ));
  }
}
