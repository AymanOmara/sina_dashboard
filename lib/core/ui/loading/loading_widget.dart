import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.loadingState,
    required this.successWidget,
    required this.onRetry,
    this.emptyImagePath = "",
    this.emptyTitle = "",
    this.emptyWidget,
  });

  final Widget successWidget;
  final LoadingState loadingState;
  final void Function() onRetry;
  final String emptyImagePath;
  final String emptyTitle;
  final Widget? emptyWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_shouldShowSuccessWidget() || _showLoadingAboveSuccessWidget())
          _baseWidget(successWidget),
        if (_shouldShowEmptyWidget())
          _baseWidget(emptyWidget ?? _emptyWidget()),
        if (_isLoading())
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        if (loadingState is LoadingException)
          _baseWidget(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text((loadingState as LoadingException).exception.message),
                ElevatedButton(
                  onPressed: onRetry,
                  child: Text("retry".tr),
                ),
              ],
            ),
          ),
      ],
    );
  }

  bool _shouldShowSuccessWidget() {
    if (loadingState is LoadingSuccess) {
      final successState = loadingState as LoadingSuccess;
      return _isDataNotEmpty(successState.data);
    }
    return false;
  }

  bool _shouldShowEmptyWidget() {
    if (loadingState is LoadingSuccess) {
      final successState = loadingState as LoadingSuccess;
      return !_isDataNotEmpty(successState.data);
    }
    return false;
  }

  bool _showLoadingAboveSuccessWidget() {
    if (loadingState is Loading) {
      final loadingStateCasted = loadingState as Loading;
      return loadingStateCasted.showSuccessWidget;
    }
    return false;
  }

  bool _isLoading() {
    if (loadingState is Loading) {
      final loadingStateCasted = loadingState as Loading;
      return loadingStateCasted.showSuccessWidget ||
          !loadingStateCasted.showSuccessWidget;
    }
    return false;
  }

  Widget _baseWidget(Widget stateRelatedWidget) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [stateRelatedWidget],
      ),
    );
  }

  bool _isDataNotEmpty(dynamic data) {
    if (data == null) {
      return false;
    }
    if (data is List && data.isEmpty) {
      return false;
    }
    return true;
  }

  Widget _emptyWidget() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(emptyImagePath),
        const SizedBox(height: 30),
        Text(emptyTitle),
      ],
    );
  }
}