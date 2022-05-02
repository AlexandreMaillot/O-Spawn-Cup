import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/profil/profil.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'PROFIL',
      ),
      backgroundColor: colorBackgroundTheme,
      body: Column(
        children: const [
          ProfilHeader(),
          ProfilBody(),
          Divider(
            color: Colors.white,
          ),
          ProfilFooter(),
        ],
      ),
    );
  }
}
