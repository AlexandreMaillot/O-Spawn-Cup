import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_spawn_cup/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  CustomAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBackgroundTheme,

      child: AppBar(

        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/images/drawer.svg",
                height: 30,
                width: 37,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              "assets/images/settingIcon.svg",
              height: 38,
              width: 38,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'o_spawn_cup_font',
            fontSize: 29,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}