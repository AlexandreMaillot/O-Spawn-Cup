class RangPointTournament {
  int rang;
  int point;


  RangPointTournament({required this.rang,required this.point});


  RangPointTournament.fromJson(Map<String, Object?> json) : this(
    rang: json["rang"]! as int,
    point: json["point"]! as int,
  );


  Map<String, Object?> toJson() {
    return {
      "rang": rang,
      "point": point,
    };
  }
  updateRangPointTournament(){

  }
  calculRangPoint(int rang){

  }
}