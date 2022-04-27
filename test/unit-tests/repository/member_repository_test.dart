import 'package:authentication_repository/authentication_repository.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/repository/member_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

void main() {
  late MemberRepository memberRepository;
  late FakeFirebaseFirestore instance;
  const uid = '12345';
  const uid2 = '123456';
  late MemberCollectionReference memberCollection;
  const member = Member(uid: uid2);
  setUp(() async {
    instance = FakeFirebaseFirestore();
    memberCollection = MemberCollectionReference(instance);

    await memberCollection.doc(uid2).set(member);
    memberRepository =
        MemberRepository(memberCollectionReference: memberCollection);
  });
  test('add member', () async {
    const member = Member(uid: uid);
    await memberRepository.addMember(member);
    final memberCollect = await memberCollection.doc(uid).get();
    expect(memberCollect.data, member);
  });
  test('current member', () async {
    expect(memberRepository.currentMember(uid2), emits(member));
  });
  test('update member', () async {
    var member = const Member(uid: uid);
    await memberCollection.doc(uid).set(member);

    member = const Member(uid: uid, pseudo: 'MonPseudo');
    memberRepository.updateMember(member);
    final m = await memberCollection.doc(uid).get();
    expect(m.data?.pseudo, 'MonPseudo');
  });
}
