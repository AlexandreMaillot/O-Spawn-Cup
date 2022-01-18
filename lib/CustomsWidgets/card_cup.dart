import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:o_spawn_cup/view/home.dart';
import 'package:o_spawn_cup/view/sign_cup.dart';

import '../model/Tournament/tournament.dart';

class CardCup extends StatelessWidget {
  QueryDocumentSnapshot<Tournament?> tournamentSnap;
  CardCup({
    Key? key,
    required this.tournamentSnap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Tournament tournament = tournamentSnap.data()!;
    String? image = "";
    if(tournament.image != null){
      image = tournament.image;
    }
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {

            return SignCup(tournamentSnap: tournamentSnap,);
          },
        ));
      },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),

          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(image!,),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   tournamentSnap!.name,
                //   style: Theme.of(context).textTheme.headline5,
                // ),
              ],
            ),
          ),
        ),
    );
  }
}
