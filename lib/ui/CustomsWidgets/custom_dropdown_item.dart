import 'package:flutter/material.dart';

class CustomDropdownItem extends DropdownMenuItem {

  Object? value;
  String showValue;
  CustomDropdownItem({
    Key? key,
    required this.value,
    required this.showValue,
  }) : super(
    value: value,
    child: Text(showValue),
  );
}