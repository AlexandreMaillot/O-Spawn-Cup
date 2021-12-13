import 'package:o_spawn_cup/model/tournament.dart';

class RangPointTournament {
  int rang;
  int point;
  Tournament tournament;

  RangPointTournament({required this.rang,required this.point,required this.tournament});


  RangPointTournament.fromJson(Map<String, Object?> json) : this(
    rang: json["rang"]! as int,
    point: json["point"]! as int,
    tournament: json["tournament"]! as Tournament,
  );


  Map<String, Object?> toJson() {
    return {
      "rang": rang,
      "point": point,
      "tournament": tournament,
    };
  }
  updateRangPointTournament(){

  }
  calculRangPoint(int rang){

  }
}