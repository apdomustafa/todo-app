import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.onpress,
      this.textColor,
      this.color = AppColors.primaryColor,
      this.isActive = true});
  final String text;
  final VoidCallback onpress;
  Color? color;
  Color? textColor = Colors.white;
  bool isActive;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          widget.onpress();
        },
        style: TextButton.styleFrom(
            backgroundColor:
                widget.isActive ? widget.color : Colors.transparent,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: AppColors.greyColor,
                  width: widget.isActive ? 0 : 1,
                  style:
                      widget.isActive ? BorderStyle.none : BorderStyle.solid),
              borderRadius: BorderRadius.circular(4),
            )),
        child: FittedBox(
          child: Text(
            widget.text,
            style: AppStyles.styleLatoReguler16(context)
                .copyWith(color: widget.textColor),
          ),
        ));
  }
}
