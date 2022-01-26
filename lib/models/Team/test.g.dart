// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class TestCollectionReference
    implements TestQuery, FirestoreCollectionReference<TestQuerySnapshot> {
  factory TestCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TestCollectionReference;

  static Test fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Test.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Test value,
    SetOptions? options,
  ) {
    return _$TestToJson(value);
  }

  @override
  TestDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TestDocumentReference> add(Test value);
}

class _$TestCollectionReference extends _$TestQuery
    implements TestCollectionReference {
  factory _$TestCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TestCollectionReference._(
      firestore.collection('Test').withConverter(
            fromFirestore: TestCollectionReference.fromFirestore,
            toFirestore: TestCollectionReference.toFirestore,
          ),
    );
  }

  _$TestCollectionReference._(
    CollectionReference<Test> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Test> get reference =>
      super.reference as CollectionReference<Test>;

  @override
  TestDocumentReference doc([String? id]) {
    return TestDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TestDocumentReference> add(Test value) {
    return reference.add(value).then((ref) => TestDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TestCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TestDocumentReference
    extends FirestoreDocumentReference<TestDocumentSnapshot> {
  factory TestDocumentReference(DocumentReference<Test> reference) =
      _$TestDocumentReference;

  DocumentReference<Test> get reference;

  /// A reference to the [TestCollectionReference] containing this document.
  TestCollectionReference get parent {
    return _$TestCollectionReference(reference.firestore);
  }

  @override
  Stream<TestDocumentSnapshot> snapshots();

  @override
  Future<TestDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
  });

  Future<void> set(Test value);
}

class _$TestDocumentReference
    extends FirestoreDocumentReference<TestDocumentSnapshot>
    implements TestDocumentReference {
  _$TestDocumentReference(this.reference);

  @override
  final DocumentReference<Test> reference;

  /// A reference to the [TestCollectionReference] containing this document.
  TestCollectionReference get parent {
    return _$TestCollectionReference(reference.firestore);
  }

  @override
  Stream<TestDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TestDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TestDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TestDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
    };

    return reference.update(json);
  }

  Future<void> set(Test value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TestDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TestDocumentSnapshot extends FirestoreDocumentSnapshot {
  TestDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Test> snapshot;

  @override
  TestDocumentReference get reference {
    return TestDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Test? data;
}

abstract class TestQuery implements QueryReference<TestQuerySnapshot> {
  @override
  TestQuery limit(int limit);

  @override
  TestQuery limitToLast(int limit);

  TestQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  TestQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TestDocumentSnapshot? startAtDocument,
    TestDocumentSnapshot? endAtDocument,
    TestDocumentSnapshot? endBeforeDocument,
    TestDocumentSnapshot? startAfterDocument,
  });
}

class _$TestQuery extends QueryReference<TestQuerySnapshot>
    implements TestQuery {
  _$TestQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Test> reference;

  TestQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Test> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TestQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TestDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TestDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TestQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TestQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TestQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TestQuery limit(int limit) {
    return _$TestQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TestQuery limitToLast(int limit) {
    return _$TestQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TestQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$TestQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  TestQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TestDocumentSnapshot? startAtDocument,
    TestDocumentSnapshot? endAtDocument,
    TestDocumentSnapshot? endBeforeDocument,
    TestDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: false);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$TestQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TestQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TestQuerySnapshot
    extends FirestoreQuerySnapshot<TestQueryDocumentSnapshot> {
  TestQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Test> snapshot;

  @override
  final List<TestQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TestDocumentSnapshot>> docChanges;
}

class TestQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TestDocumentSnapshot {
  TestQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Test> snapshot;

  @override
  TestDocumentReference get reference {
    return TestDocumentReference(snapshot.reference);
  }

  @override
  final Test data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test _$TestFromJson(Map<String, dynamic> json) => Test(
      name: json['name'] as String,
      d: json['d'] == null ? null : DateTime.parse(json['d'] as String),
      t: Test2.fromJson(json['t'] as Map<String, dynamic>),
    )..statusCode = $enumDecode(_$StatusCodeEnumMap, json['statusCode']);

Map<String, dynamic> _$TestToJson(Test instance) => <String, dynamic>{
      'name': instance.name,
      'd': instance.d?.toIso8601String(),
      'statusCode': _$StatusCodeEnumMap[instance.statusCode],
      't': instance.t.toJson(),
    };

const _$StatusCodeEnumMap = {
  StatusCode.success: 200,
  StatusCode.weird: '500',
};
