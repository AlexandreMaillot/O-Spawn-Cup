

import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';

import 'package:o_spawn_cup/models/role_type.dart';

class MemberTournamentRepository {
  late MemberTournamentCollectionReference memberTournamentCollectionReference;
  late Team team;
  List<MemberTournament> listMemberTournament = [];
  late Stream<List<MemberTournament>> listMemberTournamentStream;
  MemberTournamentRepository({required this.memberTournamentCollectionReference,}){
    _init();
  }
  _init(){
    loadTeam();
    listMemberTournamentStream = memberTournamentCollectionReference.snapshots()
        .map((event) => event.docs
        .map((memberTournamentDoc) {
      MemberTournament memberTournament = memberTournamentDoc.data;
      memberTournament.documentId = memberTournamentDoc.id;
      return memberTournament;
    }).toList());

    listMemberTournamentStream.listen((event) {
      listMemberTournament = event;
    });
  }
  deleteMemberTournament(MemberTournament memberTournament){
    memberTournamentCollectionReference.doc(memberTournament.documentId).delete();
  }

  Future<void> loadTeam() async {
    var teamDocument = await memberTournamentCollectionReference.parent.get();

    if(teamDocument.data != null) {
      team = teamDocument.data!;
      team.documentId = teamDocument.id;
    }

  }

  bool memberIsSign(Member member){
    return listMemberTournament.where((element) => element.member == member).isNotEmpty;
  }

  bool isSign(Member member) => listMemberTournament.where((element) => element.member == member).isNotEmpty;
  addMemberTournamentInTeam(Member member,String gamerTag,RoleType roleType){
    memberTournamentCollectionReference.add(MemberTournament(gamerTag: gamerTag, role: roleType, member: member));
  }
  Stream<List<MemberTournament>> listMemberTournamentInTeam() {
    return listMemberTournamentStream;
  }
}