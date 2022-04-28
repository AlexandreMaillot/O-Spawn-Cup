part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

enum FormTournamentStatus {
  enCreation,
  enModification,
}

class AppState extends Equatable {
  const AppState({
    required this.status,
    this.user = User.empty,
    this.tournament,
    this.gameName,
    this.formTournamentStatus,
  });
  AppState copyWith({
    AppStatus? status,
    User? user,
    Tournament? tournament,
    GameName? gameName,
    FormTournamentStatus? formTournamentStatus,
  }) {
    return AppState(
      status: status ?? this.status,
      gameName: gameName,
      tournament: tournament,
      formTournamentStatus: formTournamentStatus,
      user: user,
    );
  }

  final AppStatus? status;
  final User? user;
  final Tournament? tournament;
  final GameName? gameName;
  final FormTournamentStatus? formTournamentStatus;

  @override
  List<Object?> get props =>
      [status, user, gameName, tournament, formTournamentStatus];
}
