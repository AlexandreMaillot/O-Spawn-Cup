// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rang_point_tournament.dart';

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
abstract class RangPointTournamentCollectionReference
    implements
        RangPointTournamentQuery,
        FirestoreCollectionReference<RangPointTournamentQuerySnapshot> {
  factory RangPointTournamentCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RangPointTournamentCollectionReference;

  static RangPointTournament fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return RangPointTournament.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    RangPointTournament value,
    SetOptions? options,
  ) {
    return _$RangPointTournamentToJson(value);
  }

  @override
  RangPointTournamentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RangPointTournamentDocumentReference> add(RangPointTournament value);
}

class _$RangPointTournamentCollectionReference
    extends _$RangPointTournamentQuery
    implements RangPointTournamentCollectionReference {
  factory _$RangPointTournamentCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RangPointTournamentCollectionReference._(
      firestore.collection('RangPointTournament').withConverter(
            fromFirestore: RangPointTournamentCollectionReference.fromFirestore,
            toFirestore: RangPointTournamentCollectionReference.toFirestore,
          ),
    );
  }

  _$RangPointTournamentCollectionReference._(
    CollectionReference<RangPointTournament> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<RangPointTournament> get reference =>
      super.reference as CollectionReference<RangPointTournament>;

  @override
  RangPointTournamentDocumentReference doc([String? id]) {
    return RangPointTournamentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RangPointTournamentDocumentReference> add(RangPointTournament value) {
    return reference
        .add(value)
        .then((ref) => RangPointTournamentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RangPointTournamentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RangPointTournamentDocumentReference
    extends FirestoreDocumentReference<RangPointTournamentDocumentSnapshot> {
  factory RangPointTournamentDocumentReference(
          DocumentReference<RangPointTournament> reference) =
      _$RangPointTournamentDocumentReference;

  DocumentReference<RangPointTournament> get reference;

  /// A reference to the [RangPointTournamentCollectionReference] containing this document.
  RangPointTournamentCollectionReference get parent {
    return _$RangPointTournamentCollectionReference(reference.firestore);
  }

  @override
  Stream<RangPointTournamentDocumentSnapshot> snapshots();

  @override
  Future<RangPointTournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int rang,
    int point,
  });

  Future<void> set(RangPointTournament value);
}

class _$RangPointTournamentDocumentReference
    extends FirestoreDocumentReference<RangPointTournamentDocumentSnapshot>
    implements RangPointTournamentDocumentReference {
  _$RangPointTournamentDocumentReference(this.reference);

  @override
  final DocumentReference<RangPointTournament> reference;

  /// A reference to the [RangPointTournamentCollectionReference] containing this document.
  RangPointTournamentCollectionReference get parent {
    return _$RangPointTournamentCollectionReference(reference.firestore);
  }

  @override
  Stream<RangPointTournamentDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RangPointTournamentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RangPointTournamentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RangPointTournamentDocumentSnapshot._(
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
    Object? rang = _sentinel,
    Object? point = _sentinel,
  }) async {
    final json = {
      if (rang != _sentinel) "rang": rang as int,
      if (point != _sentinel) "point": point as int,
    };

    return reference.update(json);
  }

  Future<void> set(RangPointTournament value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RangPointTournamentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RangPointTournamentDocumentSnapshot extends FirestoreDocumentSnapshot {
  RangPointTournamentDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<RangPointTournament> snapshot;

  @override
  RangPointTournamentDocumentReference get reference {
    return RangPointTournamentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final RangPointTournament? data;
}

abstract class RangPointTournamentQuery
    implements QueryReference<RangPointTournamentQuerySnapshot> {
  @override
  RangPointTournamentQuery limit(int limit);

  @override
  RangPointTournamentQuery limitToLast(int limit);

  RangPointTournamentQuery whereRang({
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
  RangPointTournamentQuery wherePoint({
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

  RangPointTournamentQuery orderByRang({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RangPointTournamentDocumentSnapshot? startAtDocument,
    RangPointTournamentDocumentSnapshot? endAtDocument,
    RangPointTournamentDocumentSnapshot? endBeforeDocument,
    RangPointTournamentDocumentSnapshot? startAfterDocument,
  });

  RangPointTournamentQuery orderByPoint({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RangPointTournamentDocumentSnapshot? startAtDocument,
    RangPointTournamentDocumentSnapshot? endAtDocument,
    RangPointTournamentDocumentSnapshot? endBeforeDocument,
    RangPointTournamentDocumentSnapshot? startAfterDocument,
  });
}

class _$RangPointTournamentQuery
    extends QueryReference<RangPointTournamentQuerySnapshot>
    implements RangPointTournamentQuery {
  _$RangPointTournamentQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<RangPointTournament> reference;

  RangPointTournamentQuerySnapshot _decodeSnapshot(
    QuerySnapshot<RangPointTournament> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RangPointTournamentQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RangPointTournamentDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RangPointTournamentDocumentSnapshot._(
            change.doc, change.doc.data()),
      );
    }).toList();

    return RangPointTournamentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RangPointTournamentQuerySnapshot> snapshots(
      [SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RangPointTournamentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RangPointTournamentQuery limit(int limit) {
    return _$RangPointTournamentQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RangPointTournamentQuery limitToLast(int limit) {
    return _$RangPointTournamentQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  RangPointTournamentQuery whereRang({
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
    return _$RangPointTournamentQuery(
      reference.where(
        'rang',
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

  RangPointTournamentQuery wherePoint({
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
    return _$RangPointTournamentQuery(
      reference.where(
        'point',
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

  RangPointTournamentQuery orderByRang({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RangPointTournamentDocumentSnapshot? startAtDocument,
    RangPointTournamentDocumentSnapshot? endAtDocument,
    RangPointTournamentDocumentSnapshot? endBeforeDocument,
    RangPointTournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('rang', descending: descending);

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

    return _$RangPointTournamentQuery(query, _collection);
  }

  RangPointTournamentQuery orderByPoint({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RangPointTournamentDocumentSnapshot? startAtDocument,
    RangPointTournamentDocumentSnapshot? endAtDocument,
    RangPointTournamentDocumentSnapshot? endBeforeDocument,
    RangPointTournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('point', descending: descending);

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

    return _$RangPointTournamentQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$RangPointTournamentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RangPointTournamentQuerySnapshot
    extends FirestoreQuerySnapshot<RangPointTournamentQueryDocumentSnapshot> {
  RangPointTournamentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<RangPointTournament> snapshot;

  @override
  final List<RangPointTournamentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RangPointTournamentDocumentSnapshot>>
      docChanges;
}

class RangPointTournamentQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements RangPointTournamentDocumentSnapshot {
  RangPointTournamentQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<RangPointTournament> snapshot;

  @override
  RangPointTournamentDocumentReference get reference {
    return RangPointTournamentDocumentReference(snapshot.reference);
  }

  @override
  final RangPointTournament data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RangPointTournament _$RangPointTournamentFromJson(Map<String, dynamic> json) =>
    RangPointTournament(
      rang: json['rang'] as int,
      point: json['point'] as int,
      tournament:
          Tournament.fromJson(json['tournament'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RangPointTournamentToJson(
        RangPointTournament instance) =>
    <String, dynamic>{
      'rang': instance.rang,
      'point': instance.point,
      'tournament': instance.tournament,
    };
