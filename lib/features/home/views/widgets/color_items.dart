import 'package:flutter/material.dart';
import 'package:todo_app2/features/home/views/widgets/color_item.dart';

class ColorItems extends StatefulWidget {
  const ColorItems({super.key, required this.selectedColor});
  final void Function(Color? selectedIcon) selectedColor;

  @override
  State<ColorItems> createState() => _ColorItemsState();
}

class _ColorItemsState extends State<ColorItems> {
  final List<Color> _itemColors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.grey,
    Colors.indigo,
    Colors.cyan,
    Colors.brown,
    Colors.deepPurple,
    Colors.lightGreen,
    Colors.teal,
    Colors.lime,
    Colors.amber,
    Colors.deepOrange,
    Colors.red,
    Colors.blueGrey,
    Colors.white,
  ];

  int itemSelected = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 19,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  itemSelected = index;
                  widget.selectedColor(_itemColors[index]);
                });
              },
              child: ColorItem(
                color: _itemColors[index],
                isActive: itemSelected == index,
              ),
            );
          }),
    );
  }
}
