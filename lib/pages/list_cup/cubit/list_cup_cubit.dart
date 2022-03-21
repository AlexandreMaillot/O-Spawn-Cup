import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/Tournament/tournament.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

part 'list_cup_state.dart';

class ListCupCubit extends Cubit<ListCupState> {
  TournamentRepository tournamentRepository;
  late StreamSubscription<List<Tournament>> _listCupSubscription;
  List<Tournament> _listTournament = [];
  final GameName? _gameName;
  ListCupCubit({required this.tournamentRepository,required GameName? gameName}) : _gameName = gameName,
        super(ListCupNoData()) {
        _listCupSubscription = tournamentRepository.listTournaments(gameName: _gameName).listen((event) async {
      _listTournament = event;
      emit(ListCupLoad());
      await Future.delayed(const Duration(seconds: 1));
      emit(ListCupLoaded(listCup: _listTournament));
    });
  }

  loadListCupWithFilter({String? name,TournamentState? tournamentState,DateTime? dateStart,TournamentType? tournamentType}) async {
    await _listCupSubscription.cancel();
    emit(ListCupFiltred());
    emit(ListCupLoad());
    await Future.delayed(const Duration(seconds: 1));
    _listCupSubscription = tournamentRepository.listTournaments(
  gameName: _gameName,
  name: name,
  tournamentState: tournamentState,
  dateStart: dateStart,
  tournamentType: tournamentType).listen((event) {
      _listTournament = event;
      if(_listTournament.isEmpty){
        emit(ListCupNoData());
      } else {
        emit(ListCupLoaded(listCup: _listTournament));
      }
    });

    if(_listTournament.isEmpty){
      emit(ListCupNoData());
    }

  }

  @override
  Future<void> close() {
    _listCupSubscription.cancel();
    return super.close();
  }
}
