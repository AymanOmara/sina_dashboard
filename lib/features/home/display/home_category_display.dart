import 'dart:ui';

import 'package:ibn_sina_flutter/features/home/display/product_type.dart';

class HomeCategoryDisplay {
  final Color color;
  final String title;
  final String iconPath;
  final ProductType productType;

  const HomeCategoryDisplay({
    required this.color,
    required this.title,
    required this.iconPath,
    required this.productType,
  });
}
