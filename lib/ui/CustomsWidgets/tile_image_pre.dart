import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TileImagePre extends StatelessWidget {
  String image;
  TileImagePre({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.asset(image,fit: BoxFit.fill).image,
          fit: BoxFit.cover,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
      ),
      height: screenSize.height / 9,
      width: screenSize.width / 4,
    );
  }
}