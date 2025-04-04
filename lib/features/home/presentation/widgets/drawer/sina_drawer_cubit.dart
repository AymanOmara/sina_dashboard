import 'package:bloc/bloc.dart';
import 'package:domain/common/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/authentication/entities/user_entity.dart';
import 'package:domain/features/authentication/use_case/delete_account_use_case.dart';
import 'package:domain/features/home/use_case/fetch_user_details_use_case.dart';
import 'package:domain/features/home/use_case/logout_use_case.dart';
import 'package:ibn_sina_flutter/core/di/injector.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_cubit.dart';
import 'package:meta/meta.dart';

part 'sina_drawer_state.dart';

class SinaDrawerCubit extends Cubit<SinaDrawerState> {
  SinaDrawerCubit(
    this._fetchUserDetailsUseCase,
    this._logoutUseCase,
    this._deleteAccountUseCase,
  ) : super(SinaDrawerInitial()) {
    user = _fetchUserDetailsUseCase();
  }

  bool get isUserLoggedIn => getIt<AppCubit>().isUserLoggedIn();
  final FetchUserDetailsUseCase _fetchUserDetailsUseCase;
  final LogoutUseCase _logoutUseCase;
  final DeleteAccountUseCase _deleteAccountUseCase;
  UserEntity? user;
  bool loading = false;

  void logout() {
    _logoutUseCase();
    emit(SinaDrawerLogoutUser());
  }

  void deleteAccount() {
    loading = true;
    emit(SinaDrawerInitial());
    _deleteAccountUseCase().then((value) {
      loading = false;
      value.fold(
          onSuccess: (data) {
            if (data) {
              _logoutUseCase();
            }
          },
          onFailure: (e) {});
      emit(SinaDrawerDeleteAccountResult(value));
    });
  }
}
