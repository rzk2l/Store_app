import 'package:first_attempt/controllers/controller.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/services/items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarScreen extends StatelessWidget {
  SearchBarScreen({super.key});
  final MyColors myColorsInstance = MyColors();
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(
      backgroundColor: myColorsInstance.bg,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  suffixIconColor: Colors.black,
                  labelText: 'Search',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                onChanged: ((value) => controller.filterList(value)),
              ),
              SizedBox(height: 20),
              Obx(
                () => Expanded(
                  child: GridView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: controller.foundItems.length,
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
                                  controller.foundItems[index].imageUrl,
                                  fit: BoxFit.fitWidth,
                                )),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.foundItems[index].price,
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      controller.foundItems[index].name,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                IconButton(
                                    onPressed: () {
                                      if (controller.foundItems[index].isFav) {
                                        GridItem foundItem =
                                            controller.foundItems[index];
                                        foundItem.isFav = false;
                                        controller.foundItems[index] =
                                            foundItem;
                                        controller.favItems.remove(
                                            controller.foundItems[index]);
                                        int id = controller.items.indexOf(
                                            controller.foundItems[index]);
                                        GridItem item = controller.items[id];
                                        item.isFav = false;
                                        controller.items[id] = item;
                                      } else {
                                        GridItem foundItem =
                                            controller.foundItems[index];
                                        foundItem.isFav = true;
                                        controller.foundItems[index] =
                                            foundItem;
                                        controller.favItems
                                            .add(controller.foundItems[index]);
                                        int id = controller.items.indexOf(
                                            controller.foundItems[index]);
                                        GridItem item = controller.items[id];
                                        item.isFav = true;
                                        controller.items[id] = item;
                                      }
                                    },
                                    icon: (controller.foundItems[index].isFav)
                                        ? Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: Colors.black,
                                          ))
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
