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
class FormTournamentDaySignChanged extends FormTournamentEventStep2 {
  const FormTournamentDaySignChanged(this.daySign);

  final int? daySign;

  @override
  List<int?> get props => [daySign];
}
class FormTournamentMonthSignChanged extends FormTournamentEventStep2 {
  const FormTournamentMonthSignChanged(this.monthSign);

  final int? monthSign;

  @override
  List<int?> get props => [monthSign];
}
class FormTournamentYearsSignChanged extends FormTournamentEventStep2 {
  const FormTournamentYearsSignChanged(this.yearsSign);

  final int? yearsSign;

  @override
  List<int?> get props => [yearsSign];
}
class FormTournamentDayStartChanged extends FormTournamentEventStep2 {
  const FormTournamentDayStartChanged(this.dayStart);

  final int? dayStart;

  @override
  List<int?> get props => [dayStart];
}
class FormTournamentMonthStartChanged extends FormTournamentEventStep2 {
  const FormTournamentMonthStartChanged(this.monthStart);

  final int? monthStart;

  @override
  List<int?> get props => [monthStart];
}
class FormTournamentYearsStartChanged extends FormTournamentEventStep2 {
  const FormTournamentYearsStartChanged(this.yearsStart);

  final int? yearsStart;

  @override
  List<int?> get props => [yearsStart];
}
class FormTournamentHoursStartChanged extends FormTournamentEventStep2 {
  const FormTournamentHoursStartChanged(this.hoursStart);

  final String hoursStart;

  @override
  List<String> get props => [hoursStart];
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

