import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/services/items.dart';
import 'package:first_attempt/widgets/grid_widget.dart';

class ItemsGrid extends StatefulWidget {
  const ItemsGrid({super.key});

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid> {
  final MyColors myColorsInstance = MyColors();
  List<GridItem> items = [
    GridItem(
        imageUrl: "items/nike2.png",
        logoUrl: 'nike_black.png',
        price: "\$100.33",
        name: "Nike 02"),
    GridItem(
        imageUrl: "items/adidas1.png",
        logoUrl: 'adidas_black.png',
        price: "\$54.33",
        name: "Adidas 01"),
    GridItem(
        imageUrl: "items/reebok1.png",
        logoUrl: 'Reebok_black.png',
        price: "\$45.00",
        name: "Reebok 01"),
    GridItem(
        imageUrl: "items/reebok2.png",
        logoUrl: 'Reebok_black.png',
        price: "\$30.00",
        name: "Reebok 02"),
    GridItem(
        imageUrl: "items/adidas2.png",
        logoUrl: 'adidas_black.png',
        price: "\$79.00",
        name: "Adidas 02"),
    GridItem(
        imageUrl: "items/adidas3.png",
        logoUrl: 'adidas_black.png',
        price: "\$69.00",
        name: "Adidas 03"),
    GridItem(
        imageUrl: "items/nike3.png",
        logoUrl: 'nike_black.png',
        price: "\$180.00",
        name: "Nike 03"),
    GridItem(
        imageUrl: "items/nb2.png",
        logoUrl: 'nb_black.png',
        price: "\$89.99",
        name: "New Balance 02"),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridWidget(items: items, myColorsInstance: myColorsInstance),
    );
  }
}
