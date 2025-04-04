import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class HomeSliderCubit extends Cubit<int> {
  final List<String> images;
  final PageController pageController = PageController();

  HomeSliderCubit(this.images) : super(0);

  void nextImage() {
    if (state < images.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state + 1);
    }
  }

  void prevImage() {
    if (state > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      emit(state - 1);
    }
  }

  void onPageChanged(int index) => emit(index);

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
