import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdown_disponibilite.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_dropdown_tournament_type.dart';
import 'package:o_spawn_cup/model/TournamentType/tounament_type_controller.dart';
import 'package:o_spawn_cup/model/TournamentType/tournament_type.dart';

import '../constant.dart';

class FloatingActionBottomSheet extends StatefulWidget {
  bool bottomSheetIsShow = false;

  FloatingActionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<FloatingActionBottomSheet> createState() =>
      _FloatingActionBottomSheetState();
}

class _FloatingActionBottomSheetState extends State<FloatingActionBottomSheet> {
  late Future<dynamic> bottomSheetController;
  late TournamentTypeController tournamentTypeController;
  late Future<List<Object?>> collectionTournament;
  List<TournamentType> listTournamentType = [];
  List<String> listTournamentTypeName = [];
  @override
  void initState() {
    // listTournamentType.forEach((element) {
    //   print(element.name);
    //   listTournamentTypeName.add(element.name);
    // });

    // collectionTournament.then((value) => print(value));
    // print(listTournamentType.toString());
    // print(collectionTournament.then((value) => listTournamentType.add(value)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: colorTheme,
      child: SvgPicture.asset(
        "assets/images/parameterIcon.svg",
        height: 30,
        width: 30,
      ),
      onPressed: () {
        setState(() {
          widget.bottomSheetIsShow = true;
        });

        bottomSheetController = showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Stack(
            children: [
              Container(
                padding: MediaQuery.of(context).viewInsets,
                color: colorBackgroundTheme,
                child: Container(
                  decoration: BoxDecoration(
                      color: colorTheme,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  padding: const EdgeInsets.only(top: 25, bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenSize.width * 0.87,
                        height: screenSize.height * 0.06,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(31),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("JOUR"),
                            DottedLine(
                              direction: Axis.vertical,
                                lineThickness: 0.5,
                              dashColor: colorHintTextTheme.withOpacity(0.43),
                            ),
                            Text("MOIS"),
                            DottedLine(
                              direction: Axis.vertical,
                              lineThickness: 0.5,
                              dashColor: colorHintTextTheme.withOpacity(0.43),
                            ),
                            Text("ANNEE"),
                          ],
                        ),
                      ),

                      TournamentTypeDropdown(
                        hintText: "TYPE DE TOURNOIS",
                      ),
                      CustomTextField(
                          textAlign: TextAlign.left,
                          screenSize: screenSize,
                          text: "NOM DU TOURNOIS",
                          buttonColor: Colors.white,
                          borderColor: Colors.white),
                      DisponibiliteDropdown(
                        hintText: "ETAT",
                      ),
                      SearchButton(screenSize: screenSize),
                    ],
                  ),
                  height: screenSize.height * 0.4,
                  width: screenSize.width,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    transform: Matrix4.translationValues(
                        0.0, screenSize.height * 0.96 - screenSize.height, 0.0),
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: colorTheme,
                      child: SvgPicture.asset(
                        "assets/images/arrowFilter.svg",
                        height: 25,
                        width: 24,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
        // bottomSheetController!.closed.then((value) {
        //   print("ee");
        //   widget.bottomSheetIsShow = false;
        //   print(widget.bottomSheetIsShow);
        // });
      },
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenSize.width * 0.60,
      height: screenSize.height * 0.06,
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pop(),
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(colorBackgroundTheme),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          )),
          // elevation: MaterialStateProperty.all<double>(
          // ),
        ),
        child: const Text("RECHERCHER",
            style: TextStyle(
              color: Color(0xffF2E96B),
            )),
      ),
    );
  }
}

enum Disponibilite { OUI, NON }
