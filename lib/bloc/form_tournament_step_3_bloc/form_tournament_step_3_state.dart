part of "form_tournament_step_3_bloc.dart";

class FormTournamentStep3State extends Equatable {

  final FormzStatus status;
  final PointPerKill pointPerKill;
  final PointPerRang pointPerRang;
  final StartRang startRang;

  const FormTournamentStep3State({
    this.status = FormzStatus.pure,
    this.pointPerKill = const PointPerKill.pure(),
    this.pointPerRang = const PointPerRang.pure(),
    this.startRang = const StartRang.pure(),
  });



  FormTournamentStep3State copyWith({
    FormzStatus? status,
    PointPerKill? pointPerKill,
    PointPerRang? pointPerRang,
    StartRang? startRang,
  }) {
    return FormTournamentStep3State(
      status: status ?? this.status,
      pointPerKill: pointPerKill ?? this.pointPerKill,
      pointPerRang: pointPerRang ?? this.pointPerRang,
      startRang: startRang ?? this.startRang,
    );
  }
  @override
  List<Object> get props => [status,pointPerKill,pointPerRang,startRang,];
}


