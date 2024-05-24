import 'package:flutter/material.dart';

class NameTF extends StatelessWidget {
  const NameTF(
      {super.key,
      required this.formKey,
      required this.obscureText,
      required this.hint,
      required this.controller});
  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final bool obscureText;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: formKey,
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return 'please enter a valid data';
            }
            return null;
          },
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16),
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
