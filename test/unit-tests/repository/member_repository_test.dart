import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

class MockAuthenticationRepository extends Mock implements AuthenticationRepository{}
void main() {
  late MemberRepository memberRepository;
  late FakeFirebaseFirestore instance;
  const String uid = '12345';
  const String uid2 = '123456';
  late MemberCollectionReference memberCollection;
  Member member = const Member(uid: uid2);
  setUp(() async {
    instance = FakeFirebaseFirestore();
    memberCollection = MemberCollectionReference(instance);

    memberCollection.doc(uid2).set(member);
    memberRepository = MemberRepository(memberCollectionReference: memberCollection);


  });
  test('add member', () async {
    var member = const Member(uid: uid);
    memberRepository.addMember(member);
    var memberCollect = await memberCollection.doc(uid).get();
    expect(memberCollect.data, member);
  });
  test('current member', () async {
    expect(memberRepository.currentMember(uid2),emits(member));
  });
  test('update member', () async {
    var member = const Member(uid: uid);
    memberCollection.doc(uid).set(member);

    member = const Member(uid: uid,pseudo: "MonPseudo");
    memberRepository.updateMember(member);
    var m = await memberCollection.doc(uid).get();
    expect(m.data?.pseudo, "MonPseudo");
  });
}