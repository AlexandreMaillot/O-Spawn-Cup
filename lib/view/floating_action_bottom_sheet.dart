
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/view/test.dart';

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

  @override
  void initState() {
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
          print("ggg");
          widget.bottomSheetIsShow = true;
          print(widget.bottomSheetIsShow);
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),

                      )
                  ),
                  padding: const EdgeInsets.only(top: 25,bottom: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                      SearchButton(screenSize: screenSize),
                    ],
                  ),
                  height: screenSize.height * 0.45,
                  width: screenSize.width,
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(

                    transform: Matrix4.translationValues(0.0, screenSize.height * 0.96 - screenSize.height, 0.0),
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: colorTheme,
                      child: SvgPicture.asset(
                        "assets/images/arrowFilter.svg",
                        height: 25,
                        width: 24,
                      ),
                      onPressed: () {

                      },
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
        onPressed:  () => Navigator.of(context).pop(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(colorBackgroundTheme),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31),
              )),
          // elevation: MaterialStateProperty.all<double>(
          // ),
        ),
        child: Text("RECHERCHER",
            style: TextStyle(
              color: Color(0xffF2E96B),
            )),
      ),
    );
  }
}