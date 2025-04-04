import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/display/loading_state.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';

import 'loading_button_cubit.dart';

class SinaLoadingButton extends StatelessWidget {
  const SinaLoadingButton({
    super.key,
    required this.child,
    required this.loadingState,
  });

  final Widget child;
  final LoadingState loadingState;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoadingButtonCubit(true),
      child: BlocConsumer<LoadingButtonCubit, bool>(
        listener: (context, state) {},
        builder: (context, state) {
          LoadingButtonCubit cubit = BlocProvider.of(context);
          if (loadingState is Loading) {
            cubit.changeLoadingState(false);
          }
          return AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
              color: orangeColor,
            ),
            duration: const Duration(milliseconds: 500),
            width: loadingState is Loading ? 60 : Get.width,
            constraints: BoxConstraints(
              minHeight: 50,
              minWidth: 60,
            ),
            alignment: Alignment.center,
            onEnd: () {
              cubit.changeLoadingState(true);
            },
            child: loadingState is Loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : cubit.didFinishLoading == true
                    ? child
                    : const SizedBox(),
          );
        },
      ),
    );
  }
}
