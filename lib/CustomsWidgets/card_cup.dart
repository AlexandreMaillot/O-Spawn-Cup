import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_spawn_cup/CustomsWidgets/text_element.dart';
import 'package:o_spawn_cup/model/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/view/home.dart';
import 'package:o_spawn_cup/view/sign_cup.dart';

import '../constant.dart';
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
          child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(22)),
                  border:
                  Border.all(color: (tournamentSnap.data()!.state == TournamentState.incriptionOuverte) ? colorOpen : (tournamentSnap.data()!.state == TournamentState.enCours) ? colorInProgress : colorClose,width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
                child: Hero(
                  tag: "tagcard_cup_${tournamentSnap.id}",
                  child: Container(
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        image: NetworkImage(image!,),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 8),
                          child: TextElement(text: tournamentSnap.data()!.date.toString().substring(6, 8) + "/" + tournamentSnap.data()!.date.toString().substring(4, 6) + "/" + tournamentSnap.data()!.date.toString().substring(0, 4),color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/tournament_type_icon.svg"),
                              TextElement(text: tournamentSnap.data()!.tournamentType.name,color: Colors.white,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ),
          ),
    );
  }
}
