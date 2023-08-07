import 'package:flutter/material.dart';
import 'package:first_attempt/services/colors.dart';
import 'package:first_attempt/services/items.dart';

class GridWidget extends StatefulWidget {
  const GridWidget({
    super.key,
    required this.items,
    required this.myColorsInstance,
  });

  final List<GridItem> items;
  final MyColors myColorsInstance;

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
  List<GridItem> favItems = [];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: widget.items.length,
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
                  color: widget.myColorsInstance.itembg,
                  child: Image.asset(
                    widget.items[index].imageUrl,
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(height: 5),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.items[index].price,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        widget.items[index].name,
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                      onPressed: () {
                        widget.items[index].isFav
                            ? setState(() => widget.items[index].isFav = false)
                            : setState(() => widget.items[index].isFav = true);
                      },
                      icon: (widget.items[index].isFav)
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
    );
  }
}
