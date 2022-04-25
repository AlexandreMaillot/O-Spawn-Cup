import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/services/authentification.dart';

enum FirebaseStatusEvent {
  teamExist,
  teamFull,
  changeRowSuccess,
  disqualifiedSuccess,
  disqualifiedFail,
  codeNotFound,
  memberNotConnect,
  cupFull,
  cupStateChangeSuccess,
  cupStateChangeFail,
  memberAlreadySign,
  memberSignSuccess,
  teamNotEmpty,
}

class FirebaseHandler {
  Member? member;

  FirebaseHandler() {
    Authentification().selectMemberConnected().listen((event) {
      member = event.data;
    });
  }

  Member addMemberFirebase(String pseudo, String uid) {
    final member = Member(pseudo: pseudo, uid: uid);
    membersRef.doc(uid).set(member);

    return member;
  }
}
