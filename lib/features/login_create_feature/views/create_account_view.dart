import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:todo_app2/core/helpers/enums.dart';
import 'package:todo_app2/core/helpers/navigation.dart';
import 'package:todo_app2/core/theming/assets.dart';
import 'package:todo_app2/core/theming/colors.dart';
import 'package:todo_app2/core/theming/icons.dart';
import 'package:todo_app2/core/theming/styles.dart';
import 'package:todo_app2/features/home/views/home_view.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/register_repo/register_with_google.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/register_repo/register_with_userName_password.dart';
import 'package:todo_app2/features/login_create_feature/view_model/register_bloc/register_bloc.dart';
import 'package:todo_app2/features/login_create_feature/views/login_view.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/cusom_text_field_form.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/custom_divider.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/custom_pass_text_field.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/password_miss_matched.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/register_button.dart';
import 'package:todo_app2/features/login_create_feature/views/widgets/sign_with_button.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key});

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confiremPassController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isLoadingValue = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoadingValue,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Builder(builder: (context) {
            return BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                if (state is RegisterLoadingState) {
                  setState(() {
                    isLoadingValue = true;
                  });
                } else if (state is RegisterFailuerState) {
                  setState(() {
                    isLoadingValue = false;
                  });
                  showCupertinoDialog(
                      context: context,
                      builder: (context) {
                        return PasswordMismatchDialog(
                            message: state.message, onDismiss: () {});
                      });
                } else if (state is RegisterWithGoogleSuccessState) {
                  setState(() {
                    isLoadingValue = false;
                  });
                  AppNavigation.navigateTO(const HomeView(), context);
                } else if (state is RegisterWithUsernameSuccessState) {
                  setState(() {
                    isLoadingValue = false;
                  });
                  AppNavigation.navigateTO(const LoginView(), context);
                }
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: AppIcons.back),
                    const Gap(20),
                    Text(
                      'Register',
                      style: AppStyles.styleLatoBold32(context),
                    ),
                    const Gap(23),
                    Text(
                      'Username',
                      style: AppStyles.styleLatoReguler16(context),
                    ),
                    const Gap(8),
                    CustomTextFieldForm(
                      text: 'Enter your Username',
                      controller: userNameController,
                      Gkey: globalKey,
                      onchange: _customizeRegisterButtonColorUN,
                    ),
                    const Gap(25),
                    Text(
                      'Passward',
                      style: AppStyles.styleLatoReguler16(context),
                    ),
                    const Gap(8),
                    CustomPassTextField(
                      controller: passController,
                      onchange: _customizeRegisterButtonColorPass,
                    ),
                    const Gap(25),
                    Text(
                      'Confirm Passward',
                      style: AppStyles.styleLatoReguler16(context),
                    ),
                    const Gap(8),
                    CustomPassTextField(
                      controller: confiremPassController,
                      onchange: _customizeRegisterButtonColorCPass,
                    ),
                    const Gap(40),
                    RegisterButton(
                      text: 'Register',
                      onpress: _registerWithUserNameAndPass,
                    ),
                    const Gap(18),
                    const CustomDivider(),
                    const Gap(18),
                    SignWith(
                        onPress: () {
                          BlocProvider.of<RegisterBloc>(context)
                              .add(RegisterWithGoogleSelected());
                        },
                        text: 'Login with Google',
                        image: Assets.svgsGoogle),
                    const Gap(20),
                    SignWith(
                        onPress: () {},
                        text: 'Login with Apple',
                        image: Assets.svgsApple),
                    const Gap(20),
                    Align(
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                              text: 'Already have an account?',
                              style: AppStyles.styleLatoReguler12(context)
                                  .copyWith(
                                color: AppColors.borderColor,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Login',
                                    style:
                                        AppStyles.styleLatoReguler12(context))
                              ]),
                        )),
                    const Gap(15),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  // customize regiset button color according to user name value
  void _customizeRegisterButtonColorUN(String value, BuildContext context) {
    if (value.length == 1) {
      BlocProvider.of<RegisterBloc>(context).userNameState =
          TextFieldState.isNotEmpty;
      BlocProvider.of<RegisterBloc>(context).add(RegisterButtonColorChanged());
    } else if (value.isEmpty) {
      BlocProvider.of<RegisterBloc>(context).userNameState =
          TextFieldState.isEmpty;
      BlocProvider.of<RegisterBloc>(context).add(RegisterInitialEvent());
    }
  }

  // customize regiset button color according to password value
  void _customizeRegisterButtonColorPass(String value, BuildContext context) {
    if (value.length == 1) {
      BlocProvider.of<RegisterBloc>(context).passState =
          TextFieldState.isNotEmpty;
      BlocProvider.of<RegisterBloc>(context).add(RegisterButtonColorChanged());
    } else if (value.isEmpty) {
      BlocProvider.of<RegisterBloc>(context).passState = TextFieldState.isEmpty;
      BlocProvider.of<RegisterBloc>(context).add(RegisterInitialEvent());
    }
  }

  // customize regiset button color according to confirm password value
  void _customizeRegisterButtonColorCPass(String value, BuildContext context) {
    if (value.length == 1) {
      BlocProvider.of<RegisterBloc>(context).confirmPassState =
          TextFieldState.isNotEmpty;
      BlocProvider.of<RegisterBloc>(context).add(RegisterButtonColorChanged());
    } else if (value.isEmpty) {
      BlocProvider.of<RegisterBloc>(context).confirmPassState =
          TextFieldState.isEmpty;
      BlocProvider.of<RegisterBloc>(context).add(RegisterInitialEvent());
    }
  }

  void _registerWithUserNameAndPass() {
    if (passController.text != confiremPassController.text) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return PasswordMismatchDialog(
                message: 'passwords does not match',
                onDismiss: () {
                  passController.clear();
                  confiremPassController.clear();
                });
          });
    } else {
      BlocProvider.of<RegisterBloc>(context).add(
          RegisterWithUsernameAndPassSelected(
              userName: userNameController.text, pass: passController.text));
    }
  }
}
