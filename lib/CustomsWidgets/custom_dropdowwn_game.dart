import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_background_around_field.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/game_name.dart';

import '../constant.dart';

class GameDropdown extends StatefulWidget {
  String hintText;
  GameName? dropdownValue;

  GameDropdown({Key? key, required this.hintText}) : super(key: key);

  @override
  _GameDropdownDropdownState createState() => _GameDropdownDropdownState();
}

class _GameDropdownDropdownState extends State<GameDropdown> {

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BackgroundAroundField(
      screenSize: screenSize,
      child: Center(
        child: DropdownButton(
          value: widget.dropdownValue,
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: colorHintTextTheme.withOpacity(0.43),
              fontFamily: 'o_spawn_cup_font',
              fontSize: 14,
            ),
          ),
          icon: widget.dropdownValue == null
              ? IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "assets/images/downArrow.svg",
                    height: 10,
                    width: 15,
                  ))
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => setState(() {
                    widget.dropdownValue = null;
                      })),
          elevation: 16,
          style: TextStyle(color: colorBackgroundTheme),
          underline: const SizedBox(),
          onChanged: (newValue) {
            setState(() {
              widget.dropdownValue = newValue! as GameName?;
            });
          },
          items: GameName.values.map((value) {
            return DropdownMenuItem<Object>(
              value: value,
              child: Text(value.state),
            );
          }).toList(),
        ),
      ),
    );
  }
}
