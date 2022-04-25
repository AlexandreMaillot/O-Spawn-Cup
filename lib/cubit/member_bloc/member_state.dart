part of 'member_cubit.dart';

abstract class MemberState extends Equatable {
  const MemberState();
}

class MemberInitial extends MemberState {
  final Member? member;
  const MemberInitial({this.member});
  @override
  List<Member?> get props => [member];
}
