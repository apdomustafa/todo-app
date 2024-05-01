import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';

import 'package:todo_app2/features/login_create_feature/view_model/login_bloc/login_bloc.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/active_not_active_customButton.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key, required this.text, required this.onpress});
  final String text;
  final VoidCallback onpress;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<LoginBloc, LoginState>(
        buildWhen: ((previous, current) {
          return (current is LoginChageButtonColor || current is LoginInitial)
              ? true
              : false;
        }),
        builder: (context, state) {
          if (state is LoginChageButtonColor) {
            return ActiveCustomButton(text: 'Login', onpress: widget.onpress);
          } else {
            return const NotActiveCustomButton(
              text: 'Login',
            );
          }
        },
      ),
    );
  }
}
