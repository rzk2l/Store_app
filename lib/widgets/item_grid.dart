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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridWidget(myColorsInstance: myColorsInstance),
    );
  }
}
