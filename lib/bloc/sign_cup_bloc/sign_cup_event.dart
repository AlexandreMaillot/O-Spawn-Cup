part of 'sign_cup_bloc.dart';

abstract class SignCupEvent extends Equatable {
  const SignCupEvent();
}
class SignCupGamerTagChanged extends SignCupEvent {
  const SignCupGamerTagChanged(this.gamerTag);

  final String gamerTag;

  @override
  List<Object> get props => [gamerTag];
}
class SignCupTeamCodeChanged extends SignCupEvent {
  const SignCupTeamCodeChanged(this.teamCode);

  final String teamCode;

  @override
  List<Object> get props => [teamCode];
}
