import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_app2/core/helpers/enums.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/login_repo.dart/Login_repo.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/login_repo.dart/login_with_email_pass.dart';
import 'package:todo_app2/features/login_create_feature/model/repos/login_repo.dart/login_with_google.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  TextFieldState userNameState = TextFieldState.isEmpty;
  TextFieldState passState = TextFieldState.isEmpty;
  late LoginRepo _loginRepo;
  LoginBloc() : super(LoginInitial()) {
    on<LoginChangeButtonColorEvent>((event, emit) {
      if (userNameState == TextFieldState.isNotEmpty &&
          passState == TextFieldState.isNotEmpty) {
        emit(LoginChageButtonColor());
      }
    });

    on<LoginInitialEvent>((event, emit) {
      emit(LoginInitial());
    });

    on<LoginWithEmailAndPassEvent>((event, emit) async {
      emit(LoginLoadingState());
      _loginRepo =
          LoginWithEmailAndPass(userName: event.userName, pass: event.pass);
      var result = await _loginRepo.login();
      result.fold((failuer) {
        emit(LoginFaluireState(message: failuer.message));
      }, (credential) {
        emit(LoginSuccessState());
      });
    });

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(LoginLoadingState());
      _loginRepo = LoginWithGoogle();
      var data = await _loginRepo.login();
      data.fold((failuer) {
        emit(LoginFaluireState(message: failuer.message));
      }, (credential) {
        emit(LoginSuccessState());
      });
    });
  }
}
