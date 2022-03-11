part of 'app_bloc.dart';
enum AppStatus {
  authenticated,
  unauthenticated,
}
class AppState extends Equatable {
  const AppState._({
    required this.status,
    this.member = Member.empty,
  });

  const AppState.authenticated(Member member)
      : this._(status: AppStatus.authenticated, member: member);

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  final AppStatus status;
  final Member member;

  @override
  List<Object> get props => [status, member];
}
