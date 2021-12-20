import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';

import '../constant.dart';

class DropdownTournamentFilter extends StatefulWidget {
  @override
  _DropdownTournamentFilterState createState() => _DropdownTournamentFilterState();
}

class _DropdownTournamentFilterState extends State<DropdownTournamentFilter> {
  TournamentState? dropdownValue;


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
            child: DropdownButton<TournamentState>(
              value: dropdownValue,
              isExpanded: true,
              hint: Text("ETAT",style: TextStyle(
                color: Color(0xff707070).withOpacity(0.43),
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
              underline: SizedBox(),
              onChanged: (TournamentState? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: TournamentState.values.map<DropdownMenuItem<TournamentState>>((TournamentState value) {
                return DropdownMenuItem<TournamentState>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
          ),
        );
  }
}