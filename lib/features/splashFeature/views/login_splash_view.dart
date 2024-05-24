import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/auth/views/create_account_view.dart';
import 'package:todo_app2/features/auth/views/login_view.dart';

class LoginSplashView extends StatelessWidget {
  const LoginSplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 66),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: AppIcons.back),
              ),
              const Gap(62),
              Text(
                textAlign: TextAlign.center,
                'Welcome to UpTodo',
                style: AppStyles.styleLatoBold32(context),
              ),
              const Gap(24),
              Text(
                textAlign: TextAlign.center,
                'Please login to your account or create\n new account to continue',
                style: AppStyles.styleLatoReguler16(context),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    AppNavigation.navigateTO(const LoginView(), context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Login',
                      style: AppStyles.styleLatoReguler16(context),
                    ),
                  ),
                ),
              ),
              const Gap(28),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    AppNavigation.navigateTO(
                        const CreateAccountView(), context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: AppColors.primaryColor),
                      borderRadius: BorderRadiusDirectional.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Create account',
                      style: AppStyles.styleLatoReguler16(context),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
