import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AppBar(
      automaticallyImplyLeading: false,
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
          onPressed: () {},
        ),
      ],
      title: const Text(
        "JEUX",
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'o_spawn_cup_font',
          fontSize: 29,
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
