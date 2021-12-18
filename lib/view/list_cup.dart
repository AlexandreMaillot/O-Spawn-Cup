import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_app_bar.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_drawer.dart';
import 'package:o_spawn_cup/CustomsWidgets/custom_text_field.dart';
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
  bool sheetShow = false;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _globalKey,
      drawer: CustomDrawer(screenSize: screenSize),
      appBar: const CustomAppBar(),
      bottomNavigationBar: _buildBottomAppBar(context),
      body: GestureDetector(
        onTap: () {
          if(sheetShow) {
            sheetShow = false;
            Navigator.pop(context);
          }
        },
        child: Container(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 18),
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(100, (index) {
              return CardCup(index: index);
            }),
          ),
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
          if(sheetShow == false) {
            sheetShow = true;
            _globalKey.currentState!.showBottomSheet((context) => Container(
              child: Column(
                children: [
                  CustomTextField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                  CustomTextField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                  CustomTextField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                  CustomTextField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                  CustomTextField(screenSize: screenSize,text: "E-MAIL", buttonColor: Colors.white, borderColor: Colors.white),
                ],
              ),
              height: screenSize.height * 0.4,
              width: screenSize.width,
              color: colorTheme,
            ));
          } else {
            sheetShow = false;
            Navigator.pop(context);
          }

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
