part of 'drawer_cubit.dart';

abstract class DrawerState extends Equatable {
  const DrawerState();
}

class DrawerInitial extends DrawerState {
  @override
  List<Object> get props => [];
}

class DrawerMemberChanged extends DrawerState {
  final Member member;
  const DrawerMemberChanged({required this.member});
  @override
  List<Object> get props => [member];
}
