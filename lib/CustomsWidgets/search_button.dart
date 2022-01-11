import 'package:flutter/material.dart';

import '../constant.dart';

class SearchButton extends StatelessWidget {
  VoidCallback onPressedMethod;
  SearchButton({
    Key? key,
    required this.screenSize,
    required this.onPressedMethod,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.60,
      height: screenSize.height * 0.06,
      child: ElevatedButton(
        onPressed: onPressedMethod,
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.all<Color>(colorBackgroundTheme),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              )),
          // elevation: MaterialStateProperty.all<double>(
          // ),
        ),
        child: const Text("RECHERCHER",
            style: TextStyle(
              color: Color(0xffF2E96B),
            )),
      ),
    );

  }

}

