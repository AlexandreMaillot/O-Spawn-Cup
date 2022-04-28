import 'package:flutter/material.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class CustomButtonTheme extends StatelessWidget {
  final Color colorButton;
  final Color colorText;
  final String text;
  final VoidCallback onPressedMethod;
  final double width;
  final double height;
  const CustomButtonTheme({
    Key? key,
    this.width = 0,
    this.height = 0,
    required this.colorButton,
    required this.colorText,
    required this.text,
    required this.onPressedMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: (width == 0.0) ? screenSize.width * 0.87 : width,
      height: (height == 0.0) ? screenSize.height * 0.05 : height,
      child: ElevatedButton(
        key: const Key('ElevatedButton'),
        onPressed: onPressedMethod,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorButton),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(31)),
            ),
          ),
          // elevation: MaterialStateProperty.all<double>(
          // ),
        ),
        child: TextElement(
          text: text,
          color: colorText,
        ),
      ),
    );
  }
}
