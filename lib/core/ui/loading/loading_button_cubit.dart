import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingButtonCubit extends Cubit<bool>{
  LoadingButtonCubit(super.initialState);
  bool didFinishLoading = true;
  void changeLoadingState(bool value){
    didFinishLoading = value;
    emit(value);
  }
}