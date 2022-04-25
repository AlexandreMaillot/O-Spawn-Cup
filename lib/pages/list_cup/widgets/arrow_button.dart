import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_spawn_cup/constant.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          transform: Matrix4.translationValues(
            0,
            screenSize.height * 0.96 - screenSize.height,
            0,
          ),
          child: FloatingActionButton(
            heroTag: 'validFilter',
            elevation: 0,
            backgroundColor: colorTheme,
            child: SvgPicture.asset(
              'assets/images/arrowFilter.svg',
              height: 25,
              width: 24,
            ),
            onPressed: () => log(''),
          ),
        ),
      ],
    );
  }
}
