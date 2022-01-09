import 'package:flutter/material.dart';

class BackgroundAroundField extends StatelessWidget {
  BackgroundAroundField({
    Key? key,
    required this.screenSize,
    required this.child,
  }) : super(key: key);

  final Size screenSize;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenSize.width * 0.87,
        height: screenSize.height * 0.06,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(31),
        ),
        child: child);
  }
}