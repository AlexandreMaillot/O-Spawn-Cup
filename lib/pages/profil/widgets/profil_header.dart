import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/pages/profil/cubit/profil_cubit.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

class ProfilHeader extends StatelessWidget {
  const ProfilHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profilCubit = context.read<ProfilCubit>();

    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => log('null'),
                icon: const Icon(Icons.edit, color: Colors.white, size: 20),
              ),
            ],
          ),
          const CircleAvatar(radius: 50),
          TextElement(
            text: profilCubit.member?.pseudo ?? 'Mon pseudo',
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
