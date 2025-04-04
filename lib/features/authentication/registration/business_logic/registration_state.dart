part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationResult extends RegistrationState {
  final Result<UserEntity?, NetworkException> result;

  RegistrationResult({required this.result});
}
