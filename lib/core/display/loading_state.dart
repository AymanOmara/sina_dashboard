import 'package:domain/common/exceptions/network_exception.dart';

sealed class LoadingState {}

class Loading extends LoadingState {
  bool showSuccessWidget = false;

  Loading({this.showSuccessWidget = false});
}

class Idle extends LoadingState {}

class LoadingSuccess<T> extends LoadingState {
  T? data;

  LoadingSuccess({
    this.data,
  });
}

class LoadingException extends LoadingState {
  final NetworkException exception;

  LoadingException(
    this.exception,
  );
}
