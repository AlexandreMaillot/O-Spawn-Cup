part of 'app_bloc.dart';

enum AppStatus {
  authenticated,
  unauthenticated,
}

class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.user = User.empty,
    this.tournament,
    this.gameName,
    this.creatingTournament = false,
  });

  const AppState.authenticated(User user)
      : this._(status: AppStatus.authenticated, user: user);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final User user;
  final Tournament? tournament;
  final GameName? gameName;
  final bool creatingTournament;

  @override
  List<Object?> get props => [status, user,gameName,tournament];
}
