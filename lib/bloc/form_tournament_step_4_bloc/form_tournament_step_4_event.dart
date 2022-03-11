part of "form_tournament_step_4_bloc.dart";

abstract class FormTournamentEventStep4 extends Equatable {
  const FormTournamentEventStep4();
  @override
  List<Object?> get props => [];
}

class FormTournamentImageCupChanged extends FormTournamentEventStep4 {
  const FormTournamentImageCupChanged(this.imageCup);

  final File? imageCup;

  @override
  List<File?> get props => [imageCup];
}

class FormTournamentSubmitted4 extends FormTournamentEventStep4 {
  const FormTournamentSubmitted4();
}

