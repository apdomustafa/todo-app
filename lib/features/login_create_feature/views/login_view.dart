import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:todo_app2/core/helpers/enums.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/home_view.dart';
import 'package:todo_app2/features/login_create_feature/view_model/login_bloc/login_bloc.dart';
import 'package:todo_app2/features/login_create_feature/views/create_account_view.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/cusom_text_field_form.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/login_button.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/custom_divider.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/custom_pass_text_field.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/password_miss_matched.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/sign_with_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController userNamecontroller = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();
  bool isLoadingValue = false;
  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoadingValue,
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginLoadingState) {
              setState(() {
                isLoadingValue = true;
              });
            } else if (state is LoginFaluireState) {
              setState(() {
                isLoadingValue = false;
              });
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return PasswordMismatchDialog(
                        message: state.message, onDismiss: () {});
                  });
            } else if (state is LoginSuccessState) {
              setState(() {
                isLoadingValue = false;
              });
              AppNavigation.navigateTO(const HomeView(), context);
            }
          },
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: AppIcons.back,
                  ),
                  Gap(45.h),
                  Text(
                    'Login',
                    style: AppStyles.styleLatoBold32(context),
                  ),
                  Gap(53.h),
                  Text(
                    'Username',
                    style: AppStyles.styleLatoReguler16(context),
                  ),
                  Gap(8.h),
                  CustomTextFieldForm(
                    text: 'Enter your Username',
                    controller: userNamecontroller,
                    Gkey: globalKey,
                    onchange: _customizeLoginButtonColorUN,
                  ),
                  Gap(25.h),
                  Text(
                    'Passward',
                    style: AppStyles.styleLatoReguler16(context),
                  ),
                  const Gap(8),
                  CustomPassTextField(
                    onchange: _customizeLoginButtonColorPass,
                    controller: passController,
                  ),
                  Gap(69.h),

                  // login button
                  LoginButton(text: 'Login', onpress: _loginWithEmailAndPass),
                  Gap(15.h),
                  const CustomDivider(),
                  Gap(15.h),
                  SignWith(
                      onPress: _loginWithGoogle,
                      text: 'Login with Google',
                      image: Assets.svgsGoogle),
                  const Gap(20),
                  SignWith(
                      onPress: () {},
                      text: 'Login with Apple',
                      image: Assets.svgsApple),
                  Gap(50.h),

                  Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                            text: 'Don’t have an account?',
                            style:
                                AppStyles.styleLatoReguler12(context).copyWith(
                              color: AppColors.borderColor,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Register',
                                  style: AppStyles.styleLatoReguler12(context),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      AppNavigation.navigateTO(
                                          const CreateAccountView(), context);
                                    })
                            ]),
                      )),
                  Gap(15.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _loginWithEmailAndPass() {
    if (globalKey.currentState!.validate()) {
      BlocProvider.of<LoginBloc>(context).add(LoginWithEmailAndPassEvent(
          userName: userNamecontroller.text, pass: passController.text));
    }
  }

  void _loginWithGoogle() {
    BlocProvider.of<LoginBloc>(context).add(LoginWithGoogleEvent());
  }

  // customize login button color according to user name value
  void _customizeLoginButtonColorUN(String value, BuildContext context) {
    if (value.length == 1) {
      BlocProvider.of<LoginBloc>(context).userNameState =
          TextFieldState.isNotEmpty;
      BlocProvider.of<LoginBloc>(context).add(LoginChangeButtonColorEvent());
    } else if (value.isEmpty) {
      BlocProvider.of<LoginBloc>(context).userNameState =
          TextFieldState.isEmpty;
      BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent());
    }
  }

  // customize login button color according to pass value
  void _customizeLoginButtonColorPass(String value, BuildContext context) {
    if (value.length == 1) {
      BlocProvider.of<LoginBloc>(context).passState = TextFieldState.isNotEmpty;
      BlocProvider.of<LoginBloc>(context).add(LoginChangeButtonColorEvent());
    } else if (value.isEmpty) {
      BlocProvider.of<LoginBloc>(context).passState = TextFieldState.isEmpty;
      BlocProvider.of<LoginBloc>(context).add(LoginInitialEvent());
    }
  }
}
