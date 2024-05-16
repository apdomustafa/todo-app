import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';

class CategoryIconWithRemove extends StatelessWidget {
  const CategoryIconWithRemove(
      {super.key, required this.icon, required this.removeIcon});
  final IconData? icon;
  final VoidCallback removeIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: AppColors.secondryColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Stack(
        children: [
          Center(
            child: Icon(
              icon,
              size: 30,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: removeIcon,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
                child: const Icon(
                  Icons.close,
                  size: 5,
                  // color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
