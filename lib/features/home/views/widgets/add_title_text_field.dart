import 'package:flutter/material.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/styles.dart';

class AddTitleTextField extends StatefulWidget {
  const AddTitleTextField(
      {super.key,
      required this.hint,
      required this.controller,
      required this.globalKey,
      required this.descriptionNode});
  final String hint;
  final TextEditingController controller;
  final GlobalKey globalKey;
  final FocusNode descriptionNode;

  @override
  State<AddTitleTextField> createState() => _AddTitleTextFieldState();
}

class _AddTitleTextFieldState extends State<AddTitleTextField> {
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
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
    return Form(
      key: widget.globalKey,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please enter a valid title';
          }
          return null;
        },
        textInputAction: TextInputAction.next,
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
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(widget.descriptionNode);
        },
        focusNode: _focusNode,
      ),
    );
  }
}
