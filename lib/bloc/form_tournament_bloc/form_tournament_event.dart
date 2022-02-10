part of "form_tournament_bloc.dart";

abstract class FormTournamentEvent extends Equatable {
  const FormTournamentEvent();
  @override
  List<Object?> get props => [];
}

class FormTournamentNameCupChanged extends FormTournamentEvent {
  const FormTournamentNameCupChanged(this.nameCup);

  final String nameCup;

  @override
  List<Object> get props => [nameCup];
}
class FormTournamentNumberRoundChanged extends FormTournamentEvent {
  const FormTournamentNumberRoundChanged(this.numberRound);

  final String numberRound;

  @override
  List<Object> get props => [numberRound];
}
class FormTournamentDayChanged extends FormTournamentEvent {
  const FormTournamentDayChanged(this.day);

  final String day;

  @override
  List<Object> get props => [day];
}
class FormTournamentMonthChanged extends FormTournamentEvent {
  const FormTournamentMonthChanged(this.month);

  final String month;

  @override
  List<Object> get props => [month];
}
class FormTournamentYearsChanged extends FormTournamentEvent {
  const FormTournamentYearsChanged(this.years);

  final String years;

  @override
  List<Object> get props => [years];
}
class FormTournamentPlayerByTeamChanged extends FormTournamentEvent {
  const FormTournamentPlayerByTeamChanged(this.playerByTeam);

  final String playerByTeam;

  @override
  List<Object> get props => [playerByTeam];
}
class FormTournamentServerTypeChanged extends FormTournamentEvent {
  const FormTournamentServerTypeChanged(this.serverType);

  final String? serverType;

  @override
  List<String?> get props => [serverType];
}
class FormTournamentSubmitted extends FormTournamentEvent {
  const FormTournamentSubmitted();
}
