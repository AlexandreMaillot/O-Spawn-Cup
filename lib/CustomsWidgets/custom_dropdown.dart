import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';

import '../constant.dart';

class CustomDropdown extends StatefulWidget {
  List<Object>? listObject;
  String hintText;
  CustomDropdown({required this.listObject,required this.hintText});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  Object? dropdownValue;


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
          width: screenSize.width * 0.87,
          height: screenSize.height * 0.06,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(31),
          ),
          child: Center(
            child: DropdownButton(
              value: dropdownValue,
              isExpanded: true,
              hint: Text(widget.hintText,style: TextStyle(
                color: colorHintTextTheme.withOpacity(0.43),
                fontFamily: 'o_spawn_cup_font',
                fontSize: 14,
              ),),
              icon: SvgPicture.asset(
                "assets/images/downArrow.svg",
                height: 10,
                width: 15,
              ),
              elevation: 16,
              style: TextStyle(color: colorBackgroundTheme),
              underline: const SizedBox(),
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: widget.listObject!.map((value) {
                return DropdownMenuItem<Object>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        );
  }
}