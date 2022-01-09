import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_background_around_field.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';

import '../constant.dart';

class DisponibiliteDropdown extends StatefulWidget {
  String hintText;
  DisponibiliteDropdown({required this.hintText});

  @override
  _DisponibiliteDropdownState createState() => _DisponibiliteDropdownState();
}

class _DisponibiliteDropdownState extends State<DisponibiliteDropdown> {
  Object? dropdownValue;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return BackgroundAroundField(
      screenSize: screenSize,
      child: Center(
        child: DropdownButton(
          value: dropdownValue,
          isExpanded: true,
          hint: Text(
            widget.hintText,
            style: TextStyle(
              color: colorHintTextTheme.withOpacity(0.43),
              fontFamily: 'o_spawn_cup_font',
              fontSize: 14,
            ),
          ),
          icon: dropdownValue == null
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
                        dropdownValue = null;
                      })),
          elevation: 16,
          style: TextStyle(color: colorBackgroundTheme),
          underline: const SizedBox(),
          onChanged: (newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: TournamentState.values.map((value) {
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
