part of "form_tournament_step_2_bloc.dart";

abstract class FormTournamentEventStep2 extends Equatable {
  const FormTournamentEventStep2();
  @override
  List<Object?> get props => [];
}

class FormTournamentNameCupChanged extends FormTournamentEventStep2 {
  const FormTournamentNameCupChanged(this.nameCup);

  final String nameCup;

  @override
  List<Object> get props => [nameCup];
}
class FormTournamentNumberRoundChanged extends FormTournamentEventStep2 {
  const FormTournamentNumberRoundChanged(this.numberRound);

  final int? numberRound;

  @override
  List<int?> get props => [numberRound];
}
class FormTournamentNumberTeamChanged extends FormTournamentEventStep2 {
  const FormTournamentNumberTeamChanged(this.numberTeam);

  final int? numberTeam;

  @override
  List<int?> get props => [numberTeam];
}
class FormTournamentDayChanged extends FormTournamentEventStep2 {
  const FormTournamentDayChanged(this.day);

  final int? day;

  @override
  List<int?> get props => [day];
}
class FormTournamentMonthChanged extends FormTournamentEventStep2 {
  const FormTournamentMonthChanged(this.month);

  final int? month;

  @override
  List<int?> get props => [month];
}
class FormTournamentYearsChanged extends FormTournamentEventStep2 {
  const FormTournamentYearsChanged(this.years);

  final int? years;

  @override
  List<int?> get props => [years];
}
class FormTournamentPlayerByTeamChanged extends FormTournamentEventStep2 {
  const FormTournamentPlayerByTeamChanged(this.playerByTeam);

  final int? playerByTeam;

  @override
  List<int?> get props => [playerByTeam];
}
class FormTournamentServerTypeChanged extends FormTournamentEventStep2 {
  const FormTournamentServerTypeChanged(this.serverType);

  final String? serverType;

  @override
  List<String?> get props => [serverType];
}

class FormTournamentSubmitted2 extends FormTournamentEventStep2 {
  const FormTournamentSubmitted2();
}

