import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/model/game_name.dart';

class ListCup extends StatefulWidget {
  GameName gameName;

  ListCup({Key? key,required this.gameName}) : super(key: key);

  @override
  _ListCupState createState() => _ListCupState();
}

class _ListCupState extends State<ListCup> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: const CustomAppBar(),
      bottomNavigationBar: this._buildBottomAppBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 18),
        child: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: colorTheme,
        child: SvgPicture.asset(
        "assets/images/parameterIcon.svg",
        height: 30,
        width: 30,
      ),
        onPressed: () {
          _globalKey.currentState!.showBottomSheet((context) => Container(
            child: Text("é"),
            height: screenSize.height * 0.4,
            width: screenSize.width,
            color: colorTheme,
          ));
        },
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
          Container(height: 25,)
        ],
      ),
    );
  }
}
