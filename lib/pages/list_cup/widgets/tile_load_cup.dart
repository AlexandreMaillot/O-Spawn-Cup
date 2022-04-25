import 'package:flutter/material.dart';

class TileLoadCup extends StatelessWidget {
  const TileLoadCup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(22)),
      child: Container(
        color: Colors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
