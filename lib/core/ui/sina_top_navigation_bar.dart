import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'dart:math' as math;

class SinaTopNavigationBar extends StatelessWidget {
  const SinaTopNavigationBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(),
      color: orangeColor,
      padding: EdgeInsets.only(
        top: context.mediaQueryPadding.top,
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(
                Get.locale?.languageCode == "ar" ? math.pi : 0,
              ),
              child: Image.asset(
                alignment: Alignment.center,
                'assets/images/back.png',
                width: 30,
              ),
            ),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Spacer(),
        ],
      ),
    );
    ;
  }
}
