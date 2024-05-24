import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 2,
        )),
        Text('or'),
        Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
