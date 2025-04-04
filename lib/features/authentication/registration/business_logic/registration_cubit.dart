import 'package:bloc/bloc.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/registration_entity.dart';
import 'package:domain/features/authentication/entities/registration_response.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/features/authentication/use_case/registration_use_case.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit(
    this._registrationUseCase,
  ) : super(RegistrationInitial());
  final RegistrationEntity entity = RegistrationEntity();
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;
  LoadingState loading = Idle();
  final RegistrationUseCase _registrationUseCase;

  void updatePasswordVisibility() {
    passwordObscure = !passwordObscure;
    emit(RegistrationInitial());
  }

  void updateConfirmPasswordVisibility() {
    confirmPasswordObscure = !confirmPasswordObscure;
    emit(RegistrationInitial());
  }

  void submit() {
    loading = Loading();
    emit(RegistrationInitial());
    _registrationUseCase(entity).then((value) {
      loading = Idle();
      emit(RegistrationResult(result: value));
    });
  }
}
