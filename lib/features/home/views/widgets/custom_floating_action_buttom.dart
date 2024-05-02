import 'package:flutter/material.dart';

class CustomFloationgActionButton extends StatelessWidget {
  const CustomFloationgActionButton({super.key, required this.onpressed});
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpressed,
      shape: const CircleBorder(),
      elevation: 0,
      child: const Icon(Icons.add),
    );
  }
}
