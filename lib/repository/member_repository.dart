import 'package:authentication_repository/authentication_repository.dart';
import 'package:o_spawn_cup/models/Member/member.dart';

class MemberRepository {
  MemberCollectionReference memberCollectionReference;
  MemberRepository({required this.memberCollectionReference});

  void addMember(Member member) async {
    return memberCollectionReference.doc(member.uid).set(member);
  }
  Stream<Member?> currentMember(String uid){
    return memberCollectionReference.doc(uid).snapshots().map((event) => event.data);
  }
  updateMember(Member member){
    memberCollectionReference.doc(member.uid).set(member);
  }

}