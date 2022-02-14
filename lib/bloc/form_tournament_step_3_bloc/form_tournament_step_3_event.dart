part of "form_tournament_step_3_bloc.dart";

abstract class FormTournamentEventStep3 extends Equatable {
  const FormTournamentEventStep3();
  @override
  List<Object?> get props => [];
}

class FormTournamentNameCupChanged extends FormTournamentEventStep3 {
  const FormTournamentNameCupChanged(this.nameCup);

  final String nameCup;

  @override
  List<Object> get props => [nameCup];
}

class FormTournamentSubmitted3 extends FormTournamentEventStep3 {
  const FormTournamentSubmitted3();
}

