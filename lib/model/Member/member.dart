import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'member.g.dart';
@JsonSerializable()
class Member {
  String pseudo;
  late String uid;

  Member({required this.pseudo});
}
@Collection<Member>('members')
final membersRef = MemberCollectionReference();