import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/profil/widgets/parametre_button.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';

class ProfilBody extends StatelessWidget {
  const ProfilBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SubtitleElement(
            text: 'Paramètre utilisateur',
            color: colorTheme,
          ),
          ParametreButton(
            text: 'Mon compte',
            icon: Icons.account_circle_outlined,
            onPressed: () => log('null'),
          ),
          ParametreButton(
            text: "Demande d'administration",
            icon: Icons.admin_panel_settings_outlined,
            onPressed: () => log('null'),
          ),
        ],
      ),
    );
  }
}
