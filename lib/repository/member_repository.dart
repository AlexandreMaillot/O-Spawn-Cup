import 'package:o_spawn_cup/models/Member/member.dart';

class MemberRepository {
  MemberCollectionReference memberCollectionReference;
  MemberRepository({required this.memberCollectionReference});

  Future<void> addMember(Member member) {
    return memberCollectionReference.doc(member.uid).set(member);
  }

  Stream<Member?> currentMember(String uid) {
    return memberCollectionReference
        .doc(uid)
        .snapshots()
        .map((event) => event.data);
  }

  void updateMember(Member member) {
    memberCollectionReference.doc(member.uid).set(member);
  }
}
