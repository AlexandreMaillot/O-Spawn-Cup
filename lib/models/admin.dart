import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
part 'admin.g.dart';
@JsonSerializable(explicitToJson: true)
class Admin {
  String? uid;
  Admin({required this.uid});
  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
  Map<String, dynamic> toJson() => _$AdminToJson(this);
}
@Collection<Admin>('Admins')
final adminsRef = AdminCollectionReference();