import 'package:flutter/material.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class ParametreButton extends StatelessWidget {
  const ParametreButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
      label: TextElement(
        text: text,
        color: Colors.white,
      ),
    );
  }
}
