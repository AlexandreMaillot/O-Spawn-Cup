// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

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
abstract class RoundCollectionReference
    implements RoundQuery, FirestoreCollectionReference<RoundQuerySnapshot> {
  factory RoundCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RoundCollectionReference;

  static Round fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Round.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Round value,
    SetOptions? options,
  ) {
    return _$RoundToJson(value);
  }

  @override
  RoundDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RoundDocumentReference> add(Round value);
}

class _$RoundCollectionReference extends _$RoundQuery
    implements RoundCollectionReference {
  factory _$RoundCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RoundCollectionReference._(
      firestore.collection('Round').withConverter(
            fromFirestore: RoundCollectionReference.fromFirestore,
            toFirestore: RoundCollectionReference.toFirestore,
          ),
    );
  }

  _$RoundCollectionReference._(
    CollectionReference<Round> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Round> get reference =>
      super.reference as CollectionReference<Round>;

  @override
  RoundDocumentReference doc([String? id]) {
    return RoundDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RoundDocumentReference> add(Round value) {
    return reference.add(value).then((ref) => RoundDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoundCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RoundDocumentReference
    extends FirestoreDocumentReference<RoundDocumentSnapshot> {
  factory RoundDocumentReference(DocumentReference<Round> reference) =
      _$RoundDocumentReference;

  DocumentReference<Round> get reference;

  /// A reference to the [RoundCollectionReference] containing this document.
  RoundCollectionReference get parent {
    return _$RoundCollectionReference(reference.firestore);
  }

  @override
  Stream<RoundDocumentSnapshot> snapshots();

  @override
  Future<RoundDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> set(Round value);
}

class _$RoundDocumentReference
    extends FirestoreDocumentReference<RoundDocumentSnapshot>
    implements RoundDocumentReference {
  _$RoundDocumentReference(this.reference);

  @override
  final DocumentReference<Round> reference;

  /// A reference to the [RoundCollectionReference] containing this document.
  RoundCollectionReference get parent {
    return _$RoundCollectionReference(reference.firestore);
  }

  @override
  Stream<RoundDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RoundDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RoundDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RoundDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> set(Round value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RoundDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RoundDocumentSnapshot extends FirestoreDocumentSnapshot {
  RoundDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Round> snapshot;

  @override
  RoundDocumentReference get reference {
    return RoundDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Round? data;
}

abstract class RoundQuery implements QueryReference<RoundQuerySnapshot> {
  @override
  RoundQuery limit(int limit);

  @override
  RoundQuery limitToLast(int limit);
}

class _$RoundQuery extends QueryReference<RoundQuerySnapshot>
    implements RoundQuery {
  _$RoundQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Round> reference;

  RoundQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Round> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RoundQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RoundDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RoundDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return RoundQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RoundQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RoundQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RoundQuery limit(int limit) {
    return _$RoundQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RoundQuery limitToLast(int limit) {
    return _$RoundQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoundQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RoundQuerySnapshot
    extends FirestoreQuerySnapshot<RoundQueryDocumentSnapshot> {
  RoundQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Round> snapshot;

  @override
  final List<RoundQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RoundDocumentSnapshot>> docChanges;
}

class RoundQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements RoundDocumentSnapshot {
  RoundQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Round> snapshot;

  @override
  RoundDocumentReference get reference {
    return RoundDocumentReference(snapshot.reference);
  }

  @override
  final Round data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      map: GameMap.fromJson(json['map'] as Map<String, dynamic>),
      tournament:
          Tournament.fromJson(json['tournament'] as Map<String, dynamic>),
      roundState: $enumDecode(_$RoundStateEnumMap, json['roundState']),
    );

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'map': instance.map,
      'tournament': instance.tournament,
      'roundState': _$RoundStateEnumMap[instance.roundState],
    };

const _$RoundStateEnumMap = {
  RoundState.EnAttente: 'EnAttente',
  RoundState.EnCours: 'EnCours',
  RoundState.Terminer: 'Terminer',
};
