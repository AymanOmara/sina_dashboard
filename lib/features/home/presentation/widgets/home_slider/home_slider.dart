import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ibn_sina_flutter/features/home/presentation/widgets/home_slider/home_slider_cubit.dart';

class HomeSlider extends StatelessWidget {
  final List<String> images;

  const HomeSlider({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeSliderCubit(images),
      child: Builder(builder: (context) {
        final cubit = context.read<HomeSliderCubit>();

        return BlocListener<HomeSliderCubit, int>(
          listener: (context, state) {
            cubit.pageController.animateToPage(
              state,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 250,
                child: PageView.builder(
                  controller: cubit.pageController,
                  itemCount: images.length,
                  reverse: true,
                  allowImplicitScrolling: true,
                  onPageChanged: cubit.onPageChanged,
                  itemBuilder: (context, index) {
                    return CachedNetworkImage(
                      imageUrl: images[index],
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => Image.asset(
                        "assets/images/app_square_logo.png",
                      ),
                      fit: BoxFit.fill,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              // Left Arrow
              Positioned(
                left: 10,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/slider-left-arrow.png',
                    width: 32,
                    height: 32,
                  ),
                  onPressed: cubit.prevImage,
                ),
              ),

              // Right Arrow
              Positioned(
                right: 10,
                child: IconButton(
                  icon: Image.asset(
                    'assets/images/slider-right-arrow.png',
                    width: 32,
                    height: 32,
                  ),
                  onPressed: cubit.nextImage,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
