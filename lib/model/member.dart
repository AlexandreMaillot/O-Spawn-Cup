class Member {
  String pseudo;


  Member({required this.pseudo});


  Member.fromJson(Map<String, Object?> json) : this(
    pseudo: json["pseudo"]! as String,
  );


  Map<String, Object?> toJson() {
    return {
      "pseudo": pseudo,
    };
  }
  signOut(){

  }
  updateProfile(){

  }
  deleteAccount(){

  }
  createMember(String uid){

  }
  reinitPassword(){

  }

}