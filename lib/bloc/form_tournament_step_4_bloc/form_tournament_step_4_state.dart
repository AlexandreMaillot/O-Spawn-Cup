part of "form_tournament_step_4_bloc.dart";

class FormTournamentStep4State extends Equatable {

  final FormzStatus status;
  final ImageCup imageCup;


  const FormTournamentStep4State({
    this.status = FormzStatus.pure,
    this.imageCup = const ImageCup.pure(),
  });



  FormTournamentStep4State copyWith({
    FormzStatus? status,
    ImageCup? imageCup,
    CashPrize? cashPrize,
  }) {
    return FormTournamentStep4State(
      status: status ?? this.status,
      imageCup: imageCup ?? this.imageCup,

    );
  }
  @override
  List<Object> get props => [status,imageCup];
}


