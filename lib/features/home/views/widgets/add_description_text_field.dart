import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class AddDescriptionTextField extends StatefulWidget {
  const AddDescriptionTextField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.globalKey,
      required this.focusNode});
  final String hint;
  final TextEditingController controller;
  final GlobalKey globalKey;
  final FocusNode focusNode;

  @override
  State<AddDescriptionTextField> createState() =>
      _AddDescriptionTextFieldState();
}

class _AddDescriptionTextFieldState extends State<AddDescriptionTextField> {
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = widget.focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    widget.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter a valid descreption';
          }
          return null;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: _isFocused ? 8 : 0, horizontal: _isFocused ? 16 : 0),
            hintText: widget.hint,
            hintStyle: AppStyles.styleLatoReguler18(context),
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.greyColor),
              borderRadius: BorderRadius.circular(4),
            )),
        focusNode: widget.focusNode,
      ),
    );
  }
}
