import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/model/game_name.dart';

class ListCup extends StatefulWidget {
  GameName gameName;
  ListCup({Key? key, required this.gameName}) : super(key: key);

  @override
  _ListCupState createState() => _ListCupState();
}

class _ListCupState extends State<ListCup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      // key: _globalKey,

      drawer: CustomDrawer(screenSize: screenSize),
      appBar: CustomAppBar(
        title: "TOURNOIS",
      ),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          color: colorBackgroundTheme,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index) {
              return CardCup(index: index);
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionBottomSheet(
        screenSize: screenSize,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomAppBar _buildBottomAppBar(BuildContext context) {
    return BottomAppBar(
      // shape: const CircularNotchedRectangle(),
      color: colorTheme,
      child: Row(
        children: <Widget>[
          Container(
            height: 25,
          )
        ],
      ),
    );
  }
}

class FloatingActionBottomSheet extends StatefulWidget {
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
  PersistentBottomSheetController<dynamic>? bottomSheetController;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: colorTheme,
      child: SvgPicture.asset(
        "assets/images/parameterIcon.svg",
        height: 30,
        width: 30,
      ),
      onPressed: () {
        bottomSheetController = buildShowBottomSheet(context);
        bottomSheetController!.closed.then((value) => print("ok"));
      },
    );
  }

  PersistentBottomSheetController<dynamic> buildShowBottomSheet(
      BuildContext context) {
    var tournamentState;
    Size screenSize = MediaQuery.of(context).size;
    return showBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
                screenSize: widget.screenSize,
                text: "E-MAIL",
                buttonColor: Colors.white,
                borderColor: Colors.white),
            CustomTextField(
                screenSize: widget.screenSize,
                text: "E-MAIL",
                buttonColor: Colors.white,
                borderColor: Colors.white),
            CustomTextField(
                screenSize: widget.screenSize,
                text: "NOM DU TOURNOIS",
                buttonColor: Colors.white,
                borderColor: Colors.white),
            CustomTextField(
                screenSize: widget.screenSize,
                text: "E-MAIL",
                buttonColor: Colors.white,
                borderColor: Colors.white),
            Container(
              width: screenSize.width * 0.87,
              height: screenSize.height * 0.06,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(31),
              ),
              child: DropdownButton(
                  isExpanded: true,
                  // alignment: AlignmentDirectional.center,
                  hint: Center(
                    child: Text(
                      "ETAT",
                      style: TextStyle(
                        color: Color(0xff707070).withOpacity(0.43),
                        fontFamily: 'o_spawn_cup_font',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  dropdownColor: Colors.white,
                  icon: SvgPicture.asset(
                    "assets/images/downArrow.svg",
                    height: 10,
                    width: 15,
                  ),
                  value: tournamentState,
                  underline: SizedBox(),
                  onChanged: (value) {
                    // setState(() {
                      tournamentState = value;
                    // });
                  },
                  items: TournamentState.values
                      .map((TournamentState tournamentState) {
                    return DropdownMenuItem<TournamentState>(
                        value: tournamentState,
                        child: Text(tournamentState.toString()));
                  }).toList()),
            )
          ],
        ),
        height: widget.screenSize.height * 0.4,
        width: widget.screenSize.width,
        color: colorTheme,
      ),
    );
  }
}

class CardCup extends StatelessWidget {
  int index;
  CardCup({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Text(
          'Item ${index.toString()}',
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
    );
  }
}
