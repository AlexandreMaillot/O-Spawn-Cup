import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_background_around_field.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';

import '../constant.dart';

class TournamentTypeDropdown extends StatefulWidget {
  String hintText;
  Object? dropdownValue;
  FocusNode typeFocus;
  TournamentTypeDropdown({required this.hintText,required this.typeFocus});

  @override
  _TournamentTypeDropdownState createState() => _TournamentTypeDropdownState();
}

class _TournamentTypeDropdownState extends State<TournamentTypeDropdown> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<TournamentType> listTournamentType;
    return FirestoreBuilder<TournamentTypeQuerySnapshot>(
        ref: tournamentTypesRef.orderByCapacityTeam(),
        builder: (context, AsyncSnapshot<TournamentTypeQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {
            return BackgroundAroundField(
              screenSize: screenSize,
              child: const Center(child: Text("Erreur de chargement")),
            );
          }
          if (!snapshot.hasData) {
            return BackgroundAroundField(
                screenSize: screenSize,
                child: const Center(child: Text("Chargement...")));
          }

          TournamentTypeQuerySnapshot querySnapshot = snapshot.requireData;
          return BackgroundAroundField(
            screenSize: screenSize,
            child: Center(
              child: DropdownButton(

                focusNode: widget.typeFocus,
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
                    widget.dropdownValue = newValue!;
                  });
                },
                items: querySnapshot.docs.map((value) {
                  return DropdownMenuItem<Object>(
                    value: value.data.name,
                    child: Text(value.data.name),
                  );
                }).toList(),
              ),
            ),
          );
        });
  }
}
