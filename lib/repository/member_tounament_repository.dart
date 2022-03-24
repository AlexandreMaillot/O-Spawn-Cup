

import 'package:o_spawn_cup/models/Member/member.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';

import 'package:o_spawn_cup/models/role_type.dart';

class MemberTournamentRepository {
  late MemberTournamentCollectionReference memberTournamentCollectionReference;
  late Team team;
  late Tournament tournament;
  List<MemberTournament> listMemberTournament = [];
  late Stream<List<MemberTournament>> listMemberTournamentStream;
  MemberTournamentRepository({required this.memberTournamentCollectionReference,}){
    _init();
  }
  _init(){
    loadTournament();
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

  }
  Future<void> loadTournament() async {
    var document = memberTournamentCollectionReference.parent;
    var document1 = document.parent.parent;
    print(document1);
    // var document2 = document1.parent;
    var tournamentDoc = await document1.get();
    // print(tournamentDoc.id);
    // tournament = tournamentDoc.data!;
  }
  Future<void> loadTeam() async {
    var teamDocument = await memberTournamentCollectionReference.parent.get();
    team = teamDocument.data!;
  }
  Future<bool> checkTeamCapacity(Team team) async {
    if(listMemberTournament.length + 1 <= tournament.tournamentType.capacityTeam) {
      return true;
    } else {
      return false;
    }
  }
  addMemberInTeam(Member member,String gamerTag,RoleType roleType){
    memberTournamentCollectionReference.add(MemberTournament(gamerTag: gamerTag, role: roleType, member: member));
  }
  Stream<List<MemberTournament>> listMemberInTeam() {
    return listMemberTournamentStream;
  }
}