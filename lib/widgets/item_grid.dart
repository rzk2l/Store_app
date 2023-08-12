import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/widgets/grid_widget.dart';

class ItemsGrid extends StatefulWidget {
  const ItemsGrid({super.key});

  @override
  State<ItemsGrid> createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid> {
  final MyColors myColorsInstance = MyColors();
  void rebuildParent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilt");
    return Expanded(
      child: GridWidget(
        rebuildParent: () => rebuildParent(),
      ),
    );
  }
}
