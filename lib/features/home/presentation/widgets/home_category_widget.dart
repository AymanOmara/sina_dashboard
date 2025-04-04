import 'package:flutter/material.dart';
import 'package:ibn_sina_flutter/core/ui/theme/colors.dart';
import 'package:ibn_sina_flutter/features/home/display/home_category_display.dart';
import 'package:get/get.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    super.key,
    required this.category,
  });

  final HomeCategoryDisplay category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 2 - 20,
      decoration: BoxDecoration(border: Border.all(color: gray)),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Row(
            children: [
              SizedBox(width: 10,),
              Text(
                category.title,
                style: TextStyle(
                  color: category.color,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: 2,
            color: category.color,
          ),
        ],
      ),
    );
  }
}
