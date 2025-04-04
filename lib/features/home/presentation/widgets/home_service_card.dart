import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/features/home/display/home_service_display.dart';

class HomeServiceCard extends StatelessWidget {
  const HomeServiceCard({
    super.key,
    required this.display,
  });

  final HomeServiceDisplay display;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(display.route);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              display.title,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
