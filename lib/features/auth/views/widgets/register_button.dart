import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';

import 'package:todo_app2/features/auth/view_model/login_bloc/login_bloc.dart';
import 'package:todo_app2/features/auth/view_model/register_bloc/register_bloc.dart';
import 'package:todo_app2/features/auth/views/widgets/active_not_active_customButton.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({super.key, required this.text, required this.onpress});
  final String text;
  final VoidCallback onpress;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<RegisterBloc, RegisterState>(
        buildWhen: ((previous, current) {
          return (current is RegisterChageButtonColor ||
                  current is RegisterInitial)
              ? true
              : false;
        }),
        builder: (context, state) {
          if (state is RegisterChageButtonColor) {
            return ActiveCustomButton(
                text: 'Register', onpress: widget.onpress);
          } else {
            return const NotActiveCustomButton(
              text: 'Register',
            );
          }
        },
      ),
    );
  }
}
