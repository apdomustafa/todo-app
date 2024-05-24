import 'package:bloc/bloc.dart';
import 'package:todo_app2/core/helpers/enums.dart';
import 'package:todo_app2/features/auth/model/repos/register_repo/register_account_repo.dart';
import 'package:todo_app2/features/auth/model/repos/register_repo/register_with_google.dart';
import 'package:todo_app2/features/auth/model/repos/register_repo/register_with_userName_password.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  TextFieldState userNameState = TextFieldState.isEmpty;
  TextFieldState emailState = TextFieldState.isEmpty;
  TextFieldState passState = TextFieldState.isEmpty;
  TextFieldState confirmPassState = TextFieldState.isEmpty;

  late RegisterAccountRepo registerAccount;

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterButtonColorChanged>((event, emit) {
      if (userNameState == TextFieldState.isNotEmpty &&
          emailState == TextFieldState.isNotEmpty &&
          passState == TextFieldState.isNotEmpty &&
          confirmPassState == TextFieldState.isNotEmpty) {
        emit(RegisterChageButtonColor());
      }
    });

    on<RegisterInitialEvent>((event, emit) {
      emit(RegisterInitial());
    });

    on<RegisterWithUsernameAndPassSelected>((event, emit) async {
      emit(RegisterLoadingState());
      registerAccount = RegisterWithUserNameAndPass(
          userName: event.userName, email: event.email, pass: event.pass);
      var data = await registerAccount.registerAccount();
      data.fold((failuer) {
        emit(RegisterFailuerState(message: failuer.message));
      }, (credential) {
        emit(RegisterWithUsernameSuccessState());
      });
    });

    on<RegisterWithGoogleSelected>((event, emit) async {
      emit(RegisterLoadingState());
      registerAccount = RegisterWithGoogle();
      var data = await registerAccount.registerAccount();
      data.fold((failuer) {
        emit(RegisterFailuerState(message: failuer.message));
      }, (credential) {
        emit(RegisterWithGoogleSuccessState());
      });
    });
  }
}
