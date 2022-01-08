import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';

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
  void initState() {
    TournamentType tournamentType = TournamentType(name: "test", capacityTeam: 999);
    // tournamentTypesRef.add(tournamentType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<TournamentType> listTournamentType;
    return FirestoreBuilder<TournamentTypeQuerySnapshot>(
        ref: tournamentTypesRef.orderByCapacityTeam(),
        builder: (context, AsyncSnapshot<TournamentTypeQuerySnapshot> snapshot, Widget? child) {
          if (snapshot.hasError) {
            return backgroundAroundField(screenSize: screenSize,child: Center(child: const Text("Erreur de chargement")),);
          }
          if (!snapshot.hasData) {
            return backgroundAroundField(screenSize: screenSize,child: Center(child: const Text("Chargement...")));
          }

          // Access the QuerySnapshot
          TournamentTypeQuerySnapshot querySnapshot = snapshot.requireData;
          return backgroundAroundField(
            screenSize: screenSize,
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

                items: querySnapshot.docs.map((value) {
                  return DropdownMenuItem<Object>(
                    value: value.reference,
                    child: Text(value.data.name),
                  );
                }).toList(),
              ),
            ),
          );
          return ListView.builder(
            itemCount: querySnapshot.docs.length,
            itemBuilder: (context, index) {
              // Access the User instance
              TournamentType tournamentType = querySnapshot.docs[index].data;

              return Text('User name: ${tournamentType.name}, age ${tournamentType.uid}');
            },
          );
        }
    );
  }
}

class backgroundAroundField extends StatelessWidget {
  backgroundAroundField({
    Key? key,
    required this.screenSize,
    required this.child,

  }) : super(key: key);

  final Size screenSize;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.06,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(31),
      ),
      child: child);
  }
}