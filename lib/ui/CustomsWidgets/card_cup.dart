import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import 'package:o_spawn_cup/bloc/bloc_router.dart';
import "package:o_spawn_cup/constant.dart";
import "package:o_spawn_cup/models/Tournament/tournament.dart";
import "package:o_spawn_cup/ui/CustomsWidgets/text_element.dart";
import "package:o_spawn_cup/models/Tournament/tournament_state.dart";
import "package:o_spawn_cup/ui/view/sign_cup.dart";



class CardCup extends StatelessWidget {
  Tournament tournament;
  CardCup({
    Key? key,
    required this.tournament,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () => Navigator.of(context).push(BlocRouter().cupDetail(tournament)),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(22)),
                  border:
                  Border.all(color: (tournament.state == TournamentState.incriptionOuverte) ? colorOpen : (tournament.state == TournamentState.enCours) ? colorInProgress : colorClose,width: 2)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
                child: Hero(
                  tag: "tagcard_cup_${tournament.documentId}",
                  child: Container(
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        image: NetworkImage(tournament.image!,),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,top: 8),
                          child: TextElement(text: tournament.date.toString().substring(6, 8) + "/" + tournament.date.toString().substring(4, 6) + "/" + tournament.date.toString().substring(0, 4),color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/tournament_type_icon.svg"),
                              TextElement(text: tournament.tournamentType.name,color: Colors.white,),
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
