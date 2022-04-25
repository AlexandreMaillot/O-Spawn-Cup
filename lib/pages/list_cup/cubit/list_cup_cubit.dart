import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/models/game_name.dart';
import 'package:o_spawn_cup/models/tournament/tournament.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';
import 'package:o_spawn_cup/pages/list_cup/filter.dart';
import 'package:o_spawn_cup/repository/tournament_repository.dart';

part 'list_cup_state.dart';

class ListCupCubit extends Cubit<ListCupState> {
  TournamentRepository tournamentRepository;
  late StreamSubscription<List<Tournament>> _listCupSubscription;
  List<Tournament> _listTournament = [];
  final GameName? _gameName;
  ListCupCubit({
    required this.tournamentRepository,
    required GameName? gameName,
  })  : _gameName = gameName,
        super(ListCupNoData()) {
    _listCupSubscription = tournamentRepository
        .listTournaments(
      gameName: _gameName,
      filter: const Filter(),
    )
        .listen((event) async {
      if (_listTournament.isEmpty) {
        emit(ListCupLoad());
        await Future<dynamic>.delayed(const Duration(seconds: 1));
      }
      _listTournament = event;
      emit(ListCupLoaded(listCup: _listTournament));
    });
  }

  Future<void> loadListCupWithFilter({
    String? name,
    TournamentState? tournamentState,
    DateTime? dateStart,
    TournamentType? tournamentType,
  }) async {
    await _listCupSubscription.cancel();
    emit(ListCupFiltred());
    emit(ListCupLoad());
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    _listCupSubscription = tournamentRepository
        .listTournaments(
      gameName: _gameName,
      filter: Filter(
        name: name,
        dateStart: dateStart,
        tournamentState: tournamentState,
        tournamentType: tournamentType,
      ),
    )
        .listen((event) {
      _listTournament = event;
      if (_listTournament.isEmpty) {
        emit(ListCupNoData());
      } else {
        emit(ListCupLoaded(listCup: _listTournament));
      }
    });

    if (_listTournament.isEmpty) {
      emit(ListCupNoData());
    }
  }

  @override
  Future<void> close() {
    _listCupSubscription.cancel();

    return super.close();
  }
}
