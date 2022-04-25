import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/role_type.dart';
import 'package:o_spawn_cup/models/team/team.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';

class MemberTournamentRepository {
  late MemberTournamentCollectionReference memberTournamentCollectionReference;
  late Team team;
  List<MemberTournament> listMemberTournament = [];
  late Stream<List<MemberTournament>> listMemberTournamentStream;
  MemberTournamentRepository({
    required this.memberTournamentCollectionReference,
  }) {
    _init();
  }
  void _init() {
    loadTeam();
    listMemberTournamentStream =
        memberTournamentCollectionReference.snapshots().map(
              (event) => event.docs.map((memberTournamentDoc) {
                return memberTournamentDoc.data
                    .copyWith(documentId: memberTournamentDoc.id);
              }).toList(),
            );

    listMemberTournamentStream.listen((event) {
      listMemberTournament = event;
    });
  }

  void deleteMemberTournament(MemberTournament memberTournament) {
    memberTournamentCollectionReference
        .doc(memberTournament.documentId)
        .delete();
  }

  Future<void> loadTeam() async {
    final teamDocument = await memberTournamentCollectionReference.parent.get();

    if (teamDocument.data != null) {
      team = teamDocument.data!;
      team = team.copyWith(documentId: teamDocument.id);
    }
  }

  bool isSign(Member member) => listMemberTournament
      .where((element) => element.member == member)
      .isNotEmpty;

  void addMemberTournamentInTeam(
    Member member,
    String gamerTag,
    RoleType roleType,
  ) {
    memberTournamentCollectionReference.add(
      MemberTournament(gamerTag: gamerTag, role: roleType, member: member),
    );
  }

  Stream<List<MemberTournament>> listMemberTournamentInTeam() {
    return listMemberTournamentStream;
  }
}
