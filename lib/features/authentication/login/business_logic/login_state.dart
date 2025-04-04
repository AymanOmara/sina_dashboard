part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginResult extends LoginState {
  final Result<bool, NetworkException> result;

  LoginResult(this.result);
}
