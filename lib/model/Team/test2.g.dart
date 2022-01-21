// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test2.dart';

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
abstract class Test2CollectionReference
    implements Test2Query, FirestoreCollectionReference<Test2QuerySnapshot> {
  factory Test2CollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$Test2CollectionReference;

  static Test2 fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Test2.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Test2 value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  Test2DocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<Test2DocumentReference> add(Test2 value);
}

class _$Test2CollectionReference extends _$Test2Query
    implements Test2CollectionReference {
  factory _$Test2CollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$Test2CollectionReference._(
      firestore.collection('Test2').withConverter(
            fromFirestore: Test2CollectionReference.fromFirestore,
            toFirestore: Test2CollectionReference.toFirestore,
          ),
    );
  }

  _$Test2CollectionReference._(
    CollectionReference<Test2> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Test2> get reference =>
      super.reference as CollectionReference<Test2>;

  @override
  Test2DocumentReference doc([String? id]) {
    return Test2DocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<Test2DocumentReference> add(Test2 value) {
    return reference.add(value).then((ref) => Test2DocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$Test2CollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class Test2DocumentReference
    extends FirestoreDocumentReference<Test2DocumentSnapshot> {
  factory Test2DocumentReference(DocumentReference<Test2> reference) =
      _$Test2DocumentReference;

  DocumentReference<Test2> get reference;

  /// A reference to the [Test2CollectionReference] containing this document.
  Test2CollectionReference get parent {
    return _$Test2CollectionReference(reference.firestore);
  }

  @override
  Stream<Test2DocumentSnapshot> snapshots();

  @override
  Future<Test2DocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int num,
  });

  Future<void> set(Test2 value);
}

class _$Test2DocumentReference
    extends FirestoreDocumentReference<Test2DocumentSnapshot>
    implements Test2DocumentReference {
  _$Test2DocumentReference(this.reference);

  @override
  final DocumentReference<Test2> reference;

  /// A reference to the [Test2CollectionReference] containing this document.
  Test2CollectionReference get parent {
    return _$Test2CollectionReference(reference.firestore);
  }

  @override
  Stream<Test2DocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return Test2DocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<Test2DocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return Test2DocumentSnapshot._(
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
    Object? num = _sentinel,
  }) async {
    final json = {
      if (num != _sentinel) "num": num as int,
    };

    return reference.update(json);
  }

  Future<void> set(Test2 value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is Test2DocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class Test2DocumentSnapshot extends FirestoreDocumentSnapshot {
  Test2DocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Test2> snapshot;

  @override
  Test2DocumentReference get reference {
    return Test2DocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Test2? data;
}

abstract class Test2Query implements QueryReference<Test2QuerySnapshot> {
  @override
  Test2Query limit(int limit);

  @override
  Test2Query limitToLast(int limit);

  Test2Query whereNum({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });

  Test2Query orderByNum({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    Test2DocumentSnapshot? startAtDocument,
    Test2DocumentSnapshot? endAtDocument,
    Test2DocumentSnapshot? endBeforeDocument,
    Test2DocumentSnapshot? startAfterDocument,
  });
}

class _$Test2Query extends QueryReference<Test2QuerySnapshot>
    implements Test2Query {
  _$Test2Query(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Test2> reference;

  Test2QuerySnapshot _decodeSnapshot(
    QuerySnapshot<Test2> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return Test2QueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<Test2DocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: Test2DocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return Test2QuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<Test2QuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<Test2QuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  Test2Query limit(int limit) {
    return _$Test2Query(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  Test2Query limitToLast(int limit) {
    return _$Test2Query(
      reference.limitToLast(limit),
      _collection,
    );
  }

  Test2Query whereNum({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$Test2Query(
      reference.where(
        'num',
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

  Test2Query orderByNum({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    Test2DocumentSnapshot? startAtDocument,
    Test2DocumentSnapshot? endAtDocument,
    Test2DocumentSnapshot? endBeforeDocument,
    Test2DocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('num', descending: false);

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

    return _$Test2Query(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$Test2Query &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class Test2QuerySnapshot
    extends FirestoreQuerySnapshot<Test2QueryDocumentSnapshot> {
  Test2QuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Test2> snapshot;

  @override
  final List<Test2QueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<Test2DocumentSnapshot>> docChanges;
}

class Test2QueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements Test2DocumentSnapshot {
  Test2QueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Test2> snapshot;

  @override
  Test2DocumentReference get reference {
    return Test2DocumentReference(snapshot.reference);
  }

  @override
  final Test2 data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Test2 _$Test2FromJson(Map<String, dynamic> json) => Test2(
      num: json['num'] as int,
    );

Map<String, dynamic> _$Test2ToJson(Test2 instance) => <String, dynamic>{
      'num': instance.num,
    };
