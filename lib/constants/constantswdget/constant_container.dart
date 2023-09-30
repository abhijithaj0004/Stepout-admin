import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  const MainContainer({
    super.key,
    this.height,
    this.width,
    this.child,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color:const Color.fromARGB(255, 225, 225, 225),
      ),
      child: child,
    );
  }
}