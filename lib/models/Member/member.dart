import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';
@JsonSerializable()
class Member {
  String pseudo;
  String uid;

  Member({required this.pseudo,required this.uid});
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
  Map<String, dynamic> toJson() => _$MemberToJson(this);
}
@Collection<Member>('Members')
final membersRef = MemberCollectionReference();