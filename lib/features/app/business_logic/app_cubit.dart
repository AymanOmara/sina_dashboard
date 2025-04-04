import 'package:domain/features/app/use_case/get_current_language_use_case.dart';
import 'package:domain/features/app/use_case/init_language_use_case.dart';
import 'package:domain/features/app/use_case/is_user_logged_in_use_case.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/features/app/business_logic/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit(
    this._currentLanguageUseCase,
    this._initLanguageUseCase,
    this._isUserLoggedInUseCase,
  ) : super(AppInitial()) {
    _setUpLanguage();
  }

  final GetCurrentLanguageUseCase _currentLanguageUseCase;
  final InitLanguageUseCase _initLanguageUseCase;
  final IsUserLoggedInUseCase _isUserLoggedInUseCase;
  String currentLocale = "";

  void _setUpLanguage() {
    if (_currentLanguageUseCase() == "") {
      currentLocale = Get.deviceLocale?.languageCode ?? "ar";
      _initLanguageUseCase(currentLocale);
    } else {
      currentLocale = _currentLanguageUseCase();
    }
    currentLocale = "ar";
  }

  bool isUserLoggedIn() {
    return _isUserLoggedInUseCase();
  }
}
