import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/profil/widgets/parametre_button.dart';
import 'package:o_spawn_cup/shared/widgets/subtiltle_element.dart';

class ProfilFooter extends StatelessWidget {
  const ProfilFooter({
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
            text: "Informations sur l'application",
            color: colorTheme,
          ),
          ParametreButton(
            text: 'Note de mise à jour',
            icon: Icons.notes,
            onPressed: () => log('null'),
          ),
          ParametreButton(
            text: 'Remerciement',
            icon: Icons.notes,
            onPressed: () => log('null'),
          ),
          ParametreButton(
            text: 'Mentions légales',
            icon: Icons.notes,
            onPressed: () => log('null'),
          ),
          ParametreButton(
            text: "Conditions d'utilisation",
            icon: Icons.notes,
            onPressed: () => log('null'),
          ),
        ],
      ),
    );
  }
}
