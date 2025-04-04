import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({
    super.key,
    required this.onMenuPressed,
  });

  final void Function() onMenuPressed;

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
            onTap: () => onMenuPressed(),
            child: Image.asset(
              'assets/images/home_menu.png',
              height: 20,
            ),
          ),
          Spacer(),
          Text(
            "main".tr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
