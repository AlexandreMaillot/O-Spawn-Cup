import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:o_spawn_cup/constant.dart";

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool backArrow;
  CustomAppBar({
    Key? key,
    required this.title,
    this.backArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorBackgroundTheme,

      child: AppBar(
        automaticallyImplyLeading: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return (backArrow) ? IconButton(
              icon: SvgPicture.asset(
                "assets/images/backArrow.svg",
                height: 30,
                width: 37,
              ),
              onPressed: () => Navigator.of(context).maybePop(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ) : Container();
          },
        ),
        actions: [
          Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: SvgPicture.asset(
                  "assets/images/drawer.svg",
                  height: 30,
                  width: 37,
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ],
        title: Text(
          title,
          style: TextStyle(
            color: colorTheme,
            shadows: [
              Shadow(color: const Color(0xff000000).withOpacity(0.39),blurRadius: 15,offset: const Offset(0, 3)),
            ],
            fontFamily: "o_spawn_cup_font",
            fontSize: 29,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}