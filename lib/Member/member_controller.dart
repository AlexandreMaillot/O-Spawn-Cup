import 'package:o_spawn_cup/Member/member_auth_controller.dart';
import 'package:o_spawn_cup/Member/member_firebase_controller.dart';

import 'member.dart';

abstract class MemberController {
  late Member member;

  MemberController();
}
enum ServiceType {
  auth,
  firebase,
}