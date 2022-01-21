import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test2.g.dart';
@JsonSerializable(explicitToJson: true)
class Test2{
  int num;
  Test2({required this.num});

  factory Test2.fromJson(Map<String, dynamic> json) => _$Test2FromJson(json);
  Map<String, dynamic> toJson() => _$Test2ToJson(this);

}
@Collection<Test2>('Test2')
final test2sRef = Test2CollectionReference();