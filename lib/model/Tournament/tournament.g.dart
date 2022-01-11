// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament.dart';

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
abstract class TournamentCollectionReference
    implements
        TournamentQuery,
        FirestoreCollectionReference<TournamentQuerySnapshot> {
  factory TournamentCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TournamentCollectionReference;

  static Tournament fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Tournament.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Tournament value,
    SetOptions? options,
  ) {
    return _$TournamentToJson(value);
  }

  @override
  TournamentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TournamentDocumentReference> add(Tournament value);
}

class _$TournamentCollectionReference extends _$TournamentQuery
    implements TournamentCollectionReference {
  factory _$TournamentCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TournamentCollectionReference._(
      firestore.collection('Tournament').withConverter(
            fromFirestore: TournamentCollectionReference.fromFirestore,
            toFirestore: TournamentCollectionReference.toFirestore,
          ),
    );
  }

  _$TournamentCollectionReference._(
    CollectionReference<Tournament> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Tournament> get reference =>
      super.reference as CollectionReference<Tournament>;

  @override
  TournamentDocumentReference doc([String? id]) {
    return TournamentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TournamentDocumentReference> add(Tournament value) {
    return reference.add(value).then((ref) => TournamentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TournamentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TournamentDocumentReference
    extends FirestoreDocumentReference<TournamentDocumentSnapshot> {
  factory TournamentDocumentReference(DocumentReference<Tournament> reference) =
      _$TournamentDocumentReference;

  DocumentReference<Tournament> get reference;

  /// A reference to the [TournamentCollectionReference] containing this document.
  TournamentCollectionReference get parent {
    return _$TournamentCollectionReference(reference.firestore);
  }

  @override
  Stream<TournamentDocumentSnapshot> snapshots();

  @override
  Future<TournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    int capacity,
    String cashPrize,
    int roundNumber,
    String? image,
    int killPointTournament,
  });

  Future<void> set(Tournament value);
}

class _$TournamentDocumentReference
    extends FirestoreDocumentReference<TournamentDocumentSnapshot>
    implements TournamentDocumentReference {
  _$TournamentDocumentReference(this.reference);

  @override
  final DocumentReference<Tournament> reference;

  /// A reference to the [TournamentCollectionReference] containing this document.
  TournamentCollectionReference get parent {
    return _$TournamentCollectionReference(reference.firestore);
  }

  @override
  Stream<TournamentDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TournamentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TournamentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TournamentDocumentSnapshot._(
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
    Object? capacity = _sentinel,
    Object? cashPrize = _sentinel,
    Object? roundNumber = _sentinel,
    Object? image = _sentinel,
    Object? killPointTournament = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (capacity != _sentinel) "capacity": capacity as int,
      if (cashPrize != _sentinel) "cashPrize": cashPrize as String,
      if (roundNumber != _sentinel) "roundNumber": roundNumber as int,
      if (image != _sentinel) "image": image as String?,
      if (killPointTournament != _sentinel)
        "killPointTournament": killPointTournament as int,
    };

    return reference.update(json);
  }

  Future<void> set(Tournament value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TournamentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TournamentDocumentSnapshot extends FirestoreDocumentSnapshot {
  TournamentDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Tournament> snapshot;

  @override
  TournamentDocumentReference get reference {
    return TournamentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Tournament? data;
}

abstract class TournamentQuery
    implements QueryReference<TournamentQuerySnapshot> {
  @override
  TournamentQuery limit(int limit);

  @override
  TournamentQuery limitToLast(int limit);

  TournamentQuery whereName({
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
  TournamentQuery whereCapacity({
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
  TournamentQuery whereCashPrize({
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
  TournamentQuery whereRoundNumber({
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
  TournamentQuery whereImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  TournamentQuery whereKillPointTournament({
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

  TournamentQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByCapacity({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByCashPrize({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByRoundNumber({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByImage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByKillPointTournament({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });
}

class _$TournamentQuery extends QueryReference<TournamentQuerySnapshot>
    implements TournamentQuery {
  _$TournamentQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Tournament> reference;

  TournamentQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Tournament> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TournamentQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TournamentDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TournamentDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TournamentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TournamentQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TournamentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TournamentQuery limit(int limit) {
    return _$TournamentQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TournamentQuery limitToLast(int limit) {
    return _$TournamentQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TournamentQuery whereName({
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
    return _$TournamentQuery(
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

  TournamentQuery whereCapacity({
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
    return _$TournamentQuery(
      reference.where(
        'capacity',
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

  TournamentQuery whereCashPrize({
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
    return _$TournamentQuery(
      reference.where(
        'cashPrize',
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

  TournamentQuery whereRoundNumber({
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
    return _$TournamentQuery(
      reference.where(
        'roundNumber',
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

  TournamentQuery whereImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$TournamentQuery(
      reference.where(
        'image',
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

  TournamentQuery whereKillPointTournament({
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
    return _$TournamentQuery(
      reference.where(
        'killPointTournament',
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

  TournamentQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
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

    return _$TournamentQuery(query, _collection);
  }

  TournamentQuery orderByCapacity({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('capacity', descending: false);

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

    return _$TournamentQuery(query, _collection);
  }

  TournamentQuery orderByCashPrize({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('cashPrize', descending: false);

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

    return _$TournamentQuery(query, _collection);
  }

  TournamentQuery orderByRoundNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('roundNumber', descending: false);

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

    return _$TournamentQuery(query, _collection);
  }

  TournamentQuery orderByImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('image', descending: false);

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

    return _$TournamentQuery(query, _collection);
  }

  TournamentQuery orderByKillPointTournament({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('killPointTournament', descending: false);

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

    return _$TournamentQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TournamentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TournamentQuerySnapshot
    extends FirestoreQuerySnapshot<TournamentQueryDocumentSnapshot> {
  TournamentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Tournament> snapshot;

  @override
  final List<TournamentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TournamentDocumentSnapshot>> docChanges;
}

class TournamentQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TournamentDocumentSnapshot {
  TournamentQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Tournament> snapshot;

  @override
  TournamentDocumentReference get reference {
    return TournamentDocumentReference(snapshot.reference);
  }

  @override
  final Tournament data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      name: json['name'] as String,
      date: DateTime.parse(json['date'] as String),
      game: $enumDecode(_$GameNameEnumMap, json['game']),
      server: $enumDecode(_$ServerTypeEnumMap, json['server']),
      tournamentType: TournamentType.fromJson(
          json['tournamentType'] as Map<String, dynamic>),
      capacity: json['capacity'] as int,
      cashPrize: json['cashPrize'] as String,
      roundNumber: json['roundNumber'] as int,
      killPointTournament: json['killPointTournament'] as int,
    )
      ..state = $enumDecode(_$TournamentStateEnumMap, json['state'])
      ..image = json['image'] as String?;

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date.toIso8601String(),
      'game': _$GameNameEnumMap[instance.game],
      'server': _$ServerTypeEnumMap[instance.server],
      'tournamentType': instance.tournamentType,
      'capacity': instance.capacity,
      'cashPrize': instance.cashPrize,
      'roundNumber': instance.roundNumber,
      'state': _$TournamentStateEnumMap[instance.state],
      'image': instance.image,
      'killPointTournament': instance.killPointTournament,
    };

const _$GameNameEnumMap = {
  GameName.Fornite: 'Fornite',
  GameName.Valorant: 'Valorant',
  GameName.LeagueOfLegend: 'LeagueOfLegend',
  GameName.CSGO: 'CSGO',
};

const _$ServerTypeEnumMap = {
  ServerType.EU: 'EU',
  ServerType.US: 'US',
};

const _$TournamentStateEnumMap = {
  TournamentState.incriptionOuverte: 'incriptionOuverte',
  TournamentState.inscriptionFermer: 'inscriptionFermer',
  TournamentState.enCours: 'enCours',
  TournamentState.annuler: 'annuler',
  TournamentState.terminer: 'terminer',
};
