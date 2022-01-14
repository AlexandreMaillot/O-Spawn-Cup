import 'package:flutter/material.dart';

import '../model/Tournament/tournament.dart';

class CardCup extends StatelessWidget {
  Tournament? tournamentSnap;
  CardCup({
    Key? key,
    required this.tournamentSnap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String? image = "";
    if(tournamentSnap?.image != null){
      image = tournamentSnap!.image;
    }
    return InkWell(
      onTap: () {

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
                Text(
                  tournamentSnap!.name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
    );
  }
}
