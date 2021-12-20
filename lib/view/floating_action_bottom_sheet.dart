
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/view/test.dart';

import '../constant.dart';

class FloatingActionBottomSheet extends StatefulWidget {
  bool bottomSheetIsShow = false;
  FloatingActionBottomSheet({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;


  @override
  State<FloatingActionBottomSheet> createState() =>
      _FloatingActionBottomSheetState();
}

class _FloatingActionBottomSheetState extends State<FloatingActionBottomSheet> {
  late PersistentBottomSheetController<dynamic> bottomSheetController;



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    TournamentState? dropdownValue;
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
          print("ggg");
          widget.bottomSheetIsShow = true;
          print(widget.bottomSheetIsShow);
        });


        bottomSheetController = showBottomSheet(
          context: context,
          builder: (context) => Container(

            padding: const EdgeInsets.only(top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownTournamentFilter(),
                DropdownTournamentFilter(),
                CustomTextField(
                    textAlign: TextAlign.left,
                    screenSize: screenSize,
                    text: "NOM DU TOURNOIS",
                    buttonColor: Colors.white,
                    borderColor: Colors.white),
                DropdownTournamentFilter(),
                DropdownTournamentFilter(),
              ],
            ),
            height: screenSize.height * 0.45,
            width: screenSize.width,
            color: colorTheme,
          ),
        );
        bottomSheetController.closed.then((value) {
          print("ee");
          widget.bottomSheetIsShow = false;
        });
      },
    );
  }
}