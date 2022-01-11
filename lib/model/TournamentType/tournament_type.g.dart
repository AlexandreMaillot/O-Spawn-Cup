// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_type.dart';

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
abstract class TournamentTypeCollectionReference
    implements
        TournamentTypeQuery,
        FirestoreCollectionReference<TournamentTypeQuerySnapshot> {
  factory TournamentTypeCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TournamentTypeCollectionReference;

  static TournamentType fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return TournamentType.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    TournamentType value,
    SetOptions? options,
  ) {
    return _$TournamentTypeToJson(value);
  }

  @override
  TournamentTypeDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TournamentTypeDocumentReference> add(TournamentType value);
}

class _$TournamentTypeCollectionReference extends _$TournamentTypeQuery
    implements TournamentTypeCollectionReference {
  factory _$TournamentTypeCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TournamentTypeCollectionReference._(
      firestore.collection('TournamentType').withConverter(
            fromFirestore: TournamentTypeCollectionReference.fromFirestore,
            toFirestore: TournamentTypeCollectionReference.toFirestore,
          ),
    );
  }

  _$TournamentTypeCollectionReference._(
    CollectionReference<TournamentType> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<TournamentType> get reference =>
      super.reference as CollectionReference<TournamentType>;

  @override
  TournamentTypeDocumentReference doc([String? id]) {
    return TournamentTypeDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TournamentTypeDocumentReference> add(TournamentType value) {
    return reference
        .add(value)
        .then((ref) => TournamentTypeDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TournamentTypeCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TournamentTypeDocumentReference
    extends FirestoreDocumentReference<TournamentTypeDocumentSnapshot> {
  factory TournamentTypeDocumentReference(
          DocumentReference<TournamentType> reference) =
      _$TournamentTypeDocumentReference;

  DocumentReference<TournamentType> get reference;

  /// A reference to the [TournamentTypeCollectionReference] containing this document.
  TournamentTypeCollectionReference get parent {
    return _$TournamentTypeCollectionReference(reference.firestore);
  }

  @override
  Stream<TournamentTypeDocumentSnapshot> snapshots();

  @override
  Future<TournamentTypeDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    int capacityTeam,
  });

  Future<void> set(TournamentType value);
}

class _$TournamentTypeDocumentReference
    extends FirestoreDocumentReference<TournamentTypeDocumentSnapshot>
    implements TournamentTypeDocumentReference {
  _$TournamentTypeDocumentReference(this.reference);

  @override
  final DocumentReference<TournamentType> reference;

  /// A reference to the [TournamentTypeCollectionReference] containing this document.
  TournamentTypeCollectionReference get parent {
    return _$TournamentTypeCollectionReference(reference.firestore);
  }

  @override
  Stream<TournamentTypeDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TournamentTypeDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TournamentTypeDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TournamentTypeDocumentSnapshot._(
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
    Object? capacityTeam = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (capacityTeam != _sentinel) "capacityTeam": capacityTeam as int,
    };

    return reference.update(json);
  }

  Future<void> set(TournamentType value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TournamentTypeDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TournamentTypeDocumentSnapshot extends FirestoreDocumentSnapshot {
  TournamentTypeDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<TournamentType> snapshot;

  @override
  TournamentTypeDocumentReference get reference {
    return TournamentTypeDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final TournamentType? data;
}

abstract class TournamentTypeQuery
    implements QueryReference<TournamentTypeQuerySnapshot> {
  @override
  TournamentTypeQuery limit(int limit);

  @override
  TournamentTypeQuery limitToLast(int limit);

  TournamentTypeQuery whereName({
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
  TournamentTypeQuery whereCapacityTeam({
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

  TournamentTypeQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TournamentTypeDocumentSnapshot? startAtDocument,
    TournamentTypeDocumentSnapshot? endAtDocument,
    TournamentTypeDocumentSnapshot? endBeforeDocument,
    TournamentTypeDocumentSnapshot? startAfterDocument,
  });

  TournamentTypeQuery orderByCapacityTeam({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TournamentTypeDocumentSnapshot? startAtDocument,
    TournamentTypeDocumentSnapshot? endAtDocument,
    TournamentTypeDocumentSnapshot? endBeforeDocument,
    TournamentTypeDocumentSnapshot? startAfterDocument,
  });
}

class _$TournamentTypeQuery extends QueryReference<TournamentTypeQuerySnapshot>
    implements TournamentTypeQuery {
  _$TournamentTypeQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<TournamentType> reference;

  TournamentTypeQuerySnapshot _decodeSnapshot(
    QuerySnapshot<TournamentType> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TournamentTypeQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TournamentTypeDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TournamentTypeDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TournamentTypeQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TournamentTypeQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TournamentTypeQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TournamentTypeQuery limit(int limit) {
    return _$TournamentTypeQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TournamentTypeQuery limitToLast(int limit) {
    return _$TournamentTypeQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TournamentTypeQuery whereName({
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
    return _$TournamentTypeQuery(
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

  TournamentTypeQuery whereCapacityTeam({
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
    return _$TournamentTypeQuery(
      reference.where(
        'capacityTeam',
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

  TournamentTypeQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentTypeDocumentSnapshot? startAtDocument,
    TournamentTypeDocumentSnapshot? endAtDocument,
    TournamentTypeDocumentSnapshot? endBeforeDocument,
    TournamentTypeDocumentSnapshot? startAfterDocument,
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

    return _$TournamentTypeQuery(query, _collection);
  }

  TournamentTypeQuery orderByCapacityTeam({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentTypeDocumentSnapshot? startAtDocument,
    TournamentTypeDocumentSnapshot? endAtDocument,
    TournamentTypeDocumentSnapshot? endBeforeDocument,
    TournamentTypeDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('capacityTeam', descending: false);

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

    return _$TournamentTypeQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TournamentTypeQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TournamentTypeQuerySnapshot
    extends FirestoreQuerySnapshot<TournamentTypeQueryDocumentSnapshot> {
  TournamentTypeQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<TournamentType> snapshot;

  @override
  final List<TournamentTypeQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TournamentTypeDocumentSnapshot>>
      docChanges;
}

class TournamentTypeQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TournamentTypeDocumentSnapshot {
  TournamentTypeQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<TournamentType> snapshot;

  @override
  TournamentTypeDocumentReference get reference {
    return TournamentTypeDocumentReference(snapshot.reference);
  }

  @override
  final TournamentType data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentType _$TournamentTypeFromJson(Map<String, dynamic> json) =>
    TournamentType(
      name: json['name'] as String,
      capacityTeam: json['capacityTeam'] as int,
    );

Map<String, dynamic> _$TournamentTypeToJson(TournamentType instance) =>
    <String, dynamic>{
      'name': instance.name,
      'capacityTeam': instance.capacityTeam,
    };
