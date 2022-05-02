part of 'profil_cubit.dart';

abstract class ProfilState extends Equatable {
  const ProfilState();
}

class ProfilInitial extends ProfilState {
  @override
  List<Object> get props => [];
}

class ProfilMemberChanged extends ProfilState {
  final Member member;
  const ProfilMemberChanged({required this.member});
  @override
  List<Object> get props => [member];
}
