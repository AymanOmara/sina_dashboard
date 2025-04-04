import 'package:bloc/bloc.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/use_case/login_use_case.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/features/home/display/i_user_logged_in_state.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._loginUseCase,
    this._userLoggedInState,
  ) : super(LoginInitial());
  String email = "";
  String password = "";
  LoadingState loading = Idle();
  final LoginUseCase _loginUseCase;
  final IUserLoggedInState _userLoggedInState;

  void submit() {
    loading = Loading();
    emit(LoginLoading());
    _loginUseCase(
      email,
      password,
      FirebaseMessaging.instance.getToken,
    ).then((value) {
      loading = Idle();
      value.fold(onSuccess: (data) {
        if (data != null) {
          _userLoggedInState.onLogin();
        }
        emit(LoginResult(Success(data != null)));
      }, onFailure: (e) {
        emit(LoginResult(Failure(e)));
      });
    });
  }
}
