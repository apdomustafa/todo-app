import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class SignWith extends StatelessWidget {
  const SignWith(
      {super.key,
      required this.onPress,
      required this.text,
      required this.image});
  final VoidCallback onPress;
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: onPress,
          style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.primaryColor,
                ),
                borderRadius: BorderRadius.circular(4),
              )),
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(image),
                  const Gap(10),
                  Text(
                    text,
                    style: AppStyles.styleLatoReguler16(context),
                  )
                ],
              ))),
    );
  }
}
