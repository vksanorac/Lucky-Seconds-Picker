import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  double? height;
  double? width;
  Color? backgroundColor;
  Widget? child;
  double? borderRadius;

  HomeCard(
      {required this.height,
      required this.width,
      required this.backgroundColor,
      required this.child,
      this.borderRadius = 15.0});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius!)),
      child: child,
    );
  }
}
