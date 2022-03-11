import "package:cloud_firestore/cloud_firestore.dart";
import "package:cloud_firestore_odm/annotation.dart";
import "package:cloud_firestore_odm/cloud_firestore_odm.dart";
import 'package:equatable/equatable.dart';
import "package:json_annotation/json_annotation.dart";

part "member.g.dart";
@JsonSerializable(explicitToJson: true)
class Member extends Equatable {
  final String pseudo;
  final String uid;
  final bool isAdmin;
  const Member({this.pseudo = "",required this.uid,this.isAdmin = false});
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);

  static const empty = Member(uid: "");

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == Member.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != Member.empty;

  @override
  List<Object?> get props => [uid, pseudo];
}
@Collection<Member>("Members")
final membersRef = MemberCollectionReference();