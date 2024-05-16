import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class EditTitleTextField extends StatefulWidget {
  const EditTitleTextField({
    super.key,
    required this.text,
    required this.controller,
  });
  final String text;
  final TextEditingController controller;

  @override
  State<EditTitleTextField> createState() => _EditTitleTextFieldState();
}

class _EditTitleTextFieldState extends State<EditTitleTextField> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(_onFocusChange);
    widget.controller.text = widget.text;
    super.initState();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
              vertical: _isFocused ? 8 : 0, horizontal: _isFocused ? 16 : 0),
          hintStyle: AppStyles.styleLatoReguler18(context),
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(4),
          )),
      focusNode: _focusNode,
    );
  }
}
