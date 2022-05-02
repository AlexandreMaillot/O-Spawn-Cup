part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

enum AppStep {
  enVisualisationProfil,
  enCreationFormulaire,
  enModificationFormulaire,
}

class AppState extends Equatable {
  const AppState({
    required this.status,
    this.user = User.empty,
    this.tournament,
    this.gameName,
    this.appStep,
  });
  AppState copyWith({
    AppStatus? status,
    User? user,
    Tournament? tournament,
    GameName? gameName,
    AppStep? appStep,
  }) {
    return AppState(
      status: status ?? this.status,
      gameName: gameName,
      tournament: tournament,
      appStep: appStep,
      user: user,
    );
  }

  final AppStatus? status;
  final User? user;
  final Tournament? tournament;
  final GameName? gameName;
  final AppStep? appStep;

  @override
  List<Object?> get props => [status, user, gameName, tournament, appStep];
}
