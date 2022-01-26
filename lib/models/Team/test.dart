import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:o_spawn_cup/models/MemberTournament/member_tournament.dart';
import 'package:o_spawn_cup/models/Team/team.dart';
import 'package:o_spawn_cup/models/Team/test2.dart';
import 'package:o_spawn_cup/models/Team/test2.dart';

import 'docr.dart';
import 'test2.dart';

part 'test.g.dart';
@DocumentReferenceJsonConverter()
@JsonSerializable(explicitToJson: true)
class Test {

  String name;
  DateTime? d;
  StatusCode statusCode = StatusCode.success;
  @JsonKey()
  Test2 t;

  Test({required this.name, required this.d,required this.t});
  factory Test.empty() => Test(name: '',t: Test2(num: 0),d: null);

  factory Test.fromJson(Map<String, dynamic> json) => _$TestFromJson(json);
  factory Test.fromDocument(DocumentSnapshot documentSnapshot) {
    final data = documentSnapshot.data();
    return data != null
        ? Test.fromJson(data as Map<String, dynamic>)
        .copyWith(reference: documentSnapshot.reference)
        : Test.empty();
  }

  copyWith({DocumentReference<Object?>? reference}) {}




}

@Collection<Test>('Test')
// @Collection<Test2>('Test/*/t',name: "ff")
final testsRef = TestCollectionReference();

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue('500')
  weird,
}

void ok() {
  Test2 te = Test2(num: 2);
  Test t = Test(name: "test", d: DateTime.now(),t: te);
  // testsRef.add(t);

  // FirebaseFirestore.instance.collection(collectionPath)
  // testsRef.doc("").
  // TeamDocumentReference tc= testsRef.doc("d605pCXq7NB0Dih22zYF").fffg.doc();
  // print(tc.toString());

}
