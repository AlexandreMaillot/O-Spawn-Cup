part of "form_tournament_step_3_bloc.dart";

abstract class FormTournamentEventStep3 extends Equatable {
  const FormTournamentEventStep3();
  @override
  List<Object?> get props => [];
}

class FormTournamentPointPerKillChanged extends FormTournamentEventStep3 {
  const FormTournamentPointPerKillChanged(this.pointPerKill);

  final int? pointPerKill;

  @override
  List<int?> get props => [pointPerKill];
}
class FormTournamentPointPerRangChanged extends FormTournamentEventStep3 {
  const FormTournamentPointPerRangChanged(this.pointPerRang);

  final int? pointPerRang;

  @override
  List<int?> get props => [pointPerRang];
}
class FormTournamentStartRangChanged extends FormTournamentEventStep3 {
  const FormTournamentStartRangChanged(this.startRang);

  final int? startRang;

  @override
  List<int?> get props => [startRang];
}

class FormTournamentSubmitted3 extends FormTournamentEventStep3 {
  const FormTournamentSubmitted3();
}

