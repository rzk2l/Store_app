import 'package:first_attempt/controllers/favorites_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(FavoritesController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
            itemCount: controller.favItems.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${controller.favItems[index]}'),
              );
            }),
      ),
    );
  }
}
