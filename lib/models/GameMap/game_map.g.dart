// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_map.dart';

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
abstract class GameMapCollectionReference
    implements
        GameMapQuery,
        FirestoreCollectionReference<GameMapQuerySnapshot> {
  factory GameMapCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$GameMapCollectionReference;

  static GameMap fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return GameMap.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    GameMap value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  GameMapDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<GameMapDocumentReference> add(GameMap value);
}

class _$GameMapCollectionReference extends _$GameMapQuery
    implements GameMapCollectionReference {
  factory _$GameMapCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$GameMapCollectionReference._(
      firestore.collection('GameMaps').withConverter(
            fromFirestore: GameMapCollectionReference.fromFirestore,
            toFirestore: GameMapCollectionReference.toFirestore,
          ),
    );
  }

  _$GameMapCollectionReference._(
    CollectionReference<GameMap> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<GameMap> get reference =>
      super.reference as CollectionReference<GameMap>;

  @override
  GameMapDocumentReference doc([String? id]) {
    return GameMapDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<GameMapDocumentReference> add(GameMap value) {
    return reference.add(value).then((ref) => GameMapDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameMapCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class GameMapDocumentReference
    extends FirestoreDocumentReference<GameMapDocumentSnapshot> {
  factory GameMapDocumentReference(DocumentReference<GameMap> reference) =
      _$GameMapDocumentReference;

  DocumentReference<GameMap> get reference;

  /// A reference to the [GameMapCollectionReference] containing this document.
  GameMapCollectionReference get parent {
    return _$GameMapCollectionReference(reference.firestore);
  }

  @override
  Stream<GameMapDocumentSnapshot> snapshots();

  @override
  Future<GameMapDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    bool isDisabled,
  });

  Future<void> set(GameMap value);
}

class _$GameMapDocumentReference
    extends FirestoreDocumentReference<GameMapDocumentSnapshot>
    implements GameMapDocumentReference {
  _$GameMapDocumentReference(this.reference);

  @override
  final DocumentReference<GameMap> reference;

  /// A reference to the [GameMapCollectionReference] containing this document.
  GameMapCollectionReference get parent {
    return _$GameMapCollectionReference(reference.firestore);
  }

  @override
  Stream<GameMapDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return GameMapDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<GameMapDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return GameMapDocumentSnapshot._(
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
    Object? isDisabled = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (isDisabled != _sentinel) "isDisabled": isDisabled as bool,
    };

    return reference.update(json);
  }

  Future<void> set(GameMap value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is GameMapDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class GameMapDocumentSnapshot extends FirestoreDocumentSnapshot {
  GameMapDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<GameMap> snapshot;

  @override
  GameMapDocumentReference get reference {
    return GameMapDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final GameMap? data;
}

abstract class GameMapQuery implements QueryReference<GameMapQuerySnapshot> {
  @override
  GameMapQuery limit(int limit);

  @override
  GameMapQuery limitToLast(int limit);

  GameMapQuery whereName({
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
  GameMapQuery whereIsDisabled({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });

  GameMapQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    GameMapDocumentSnapshot? startAtDocument,
    GameMapDocumentSnapshot? endAtDocument,
    GameMapDocumentSnapshot? endBeforeDocument,
    GameMapDocumentSnapshot? startAfterDocument,
  });

  GameMapQuery orderByIsDisabled({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    GameMapDocumentSnapshot? startAtDocument,
    GameMapDocumentSnapshot? endAtDocument,
    GameMapDocumentSnapshot? endBeforeDocument,
    GameMapDocumentSnapshot? startAfterDocument,
  });
}

class _$GameMapQuery extends QueryReference<GameMapQuerySnapshot>
    implements GameMapQuery {
  _$GameMapQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<GameMap> reference;

  GameMapQuerySnapshot _decodeSnapshot(
    QuerySnapshot<GameMap> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return GameMapQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<GameMapDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: GameMapDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return GameMapQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<GameMapQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<GameMapQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  GameMapQuery limit(int limit) {
    return _$GameMapQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  GameMapQuery limitToLast(int limit) {
    return _$GameMapQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  GameMapQuery whereName({
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
    return _$GameMapQuery(
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

  GameMapQuery whereIsDisabled({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$GameMapQuery(
      reference.where(
        'isDisabled',
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

  GameMapQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameMapDocumentSnapshot? startAtDocument,
    GameMapDocumentSnapshot? endAtDocument,
    GameMapDocumentSnapshot? endBeforeDocument,
    GameMapDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

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

    return _$GameMapQuery(query, _collection);
  }

  GameMapQuery orderByIsDisabled({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    GameMapDocumentSnapshot? startAtDocument,
    GameMapDocumentSnapshot? endAtDocument,
    GameMapDocumentSnapshot? endBeforeDocument,
    GameMapDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isDisabled', descending: descending);

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

    return _$GameMapQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$GameMapQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class GameMapQuerySnapshot
    extends FirestoreQuerySnapshot<GameMapQueryDocumentSnapshot> {
  GameMapQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<GameMap> snapshot;

  @override
  final List<GameMapQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<GameMapDocumentSnapshot>> docChanges;
}

class GameMapQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements GameMapDocumentSnapshot {
  GameMapQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<GameMap> snapshot;

  @override
  GameMapDocumentReference get reference {
    return GameMapDocumentReference(snapshot.reference);
  }

  @override
  final GameMap data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameMap _$GameMapFromJson(Map<String, dynamic> json) => GameMap(
      gameName: $enumDecode(_$GameNameEnumMap, json['gameName']),
      name: json['name'] as String,
    )..isDisabled = json['isDisabled'] as bool;

Map<String, dynamic> _$GameMapToJson(GameMap instance) => <String, dynamic>{
      'gameName': _$GameNameEnumMap[instance.gameName],
      'name': instance.name,
      'isDisabled': instance.isDisabled,
    };

const _$GameNameEnumMap = {
  GameName.Fornite: 'Fornite',
  GameName.Valorant: 'Valorant',
  GameName.LeagueOfLegend: 'LeagueOfLegend',
  GameName.CSGO: 'CSGO',
};
