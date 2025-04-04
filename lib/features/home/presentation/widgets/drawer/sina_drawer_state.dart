part of 'sina_drawer_cubit.dart';

@immutable
sealed class SinaDrawerState {}

final class SinaDrawerInitial extends SinaDrawerState {}

final class SinaDrawerLogoutUser extends SinaDrawerState {}

final class SinaDrawerDeleteAccountResult extends SinaDrawerState {
  final Result<bool, NetworkException> result;

  SinaDrawerDeleteAccountResult(this.result);
}
