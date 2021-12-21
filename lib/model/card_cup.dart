import 'package:flutter/material.dart';

class CardCup extends StatelessWidget {
  int index;
  CardCup({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Center(
          child: Text(
            'Item ${index.toString()}',
            style: Theme.of(context).textTheme.headline5,
          ),
        ),
      ),
    );
  }
}
