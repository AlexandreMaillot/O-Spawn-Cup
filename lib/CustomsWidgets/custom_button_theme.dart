import 'package:flutter/material.dart';

import '../constant.dart';

class CustomButtonTheme extends StatelessWidget {
  Color colorButton;
  String text;
  CustomButtonTheme({
    Key? key,
    required this.colorButton,
    required this.screenSize,
    required this.text,

  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width,
      height: 42,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorButton),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          )),
          // elevation: MaterialStateProperty.all<double>(
          // ),
        ),
        child: Text(text,
            style: const TextStyle(
              color: Color(0xff1B2522),
            )),
      ),
    );
  }
}
