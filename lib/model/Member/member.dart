class Member {
  String pseudo;
  late String uid;

  Member({required this.pseudo});


  Member.fromJson(Map<String, Object?> json) : this(
    pseudo: json["pseudo"]! as String,
  );


  Map<String, Object?> toJson() {
    return {
      "pseudo": pseudo,
      "uid": uid,
    };
  }


}