import 'package:flutter/material.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class columnTable extends StatelessWidget {
  const columnTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 3,
          child: TextElement(
            text: 'Nom des équipes',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: 'Rang',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: 'KDA',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: TextElement(
            text: 'Ratio',
            color: Colors.white,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}