import 'package:first_attempt/services/controller.dart';
import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:get/get.dart';

class GridWidget extends StatelessWidget {
  GridWidget({
    super.key,
    required this.rebuildParent,
  });

  final Function() rebuildParent;
  final MyColors myColorsInstance = MyColors();
  final FavoritesController controller = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
                          rebuildParent();
                          if (controller.items[index].isFav) {
                            controller.items[index].isFav = false;
                            controller.favItems.remove(controller.items[index]);
                          } else {
                            controller.items[index].isFav = true;
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
                              ),
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
