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
    //Since this widget is not rebuilding when GridWidget changes the state, This function is used to trigger the rebuild of this class
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridWidget(
        rebuildParent: () => rebuildParent(),
      ),
    );
  }
}
