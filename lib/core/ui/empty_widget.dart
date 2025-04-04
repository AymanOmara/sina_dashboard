import 'package:flutter/material.dart';


class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }

}
