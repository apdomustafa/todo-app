import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.color, required this.isActive});
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      height: 36,
      width: 36,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Center(
        child: isActive
            ? const Icon(
                Icons.check,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}
