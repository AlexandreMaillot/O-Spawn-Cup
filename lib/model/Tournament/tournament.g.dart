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
    return value.toJson();
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

  late final TeamCollectionReference listTeam = _$TeamCollectionReference(
    reference,
  );

  @override
  Stream<TournamentDocumentSnapshot> snapshots();

  @override
  Future<TournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    int date,
    int capacity,
    String cashPrize,
    int roundNumber,
    String? image,
    int killPointTournament,
    List<Team> listTeam,
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

  late final TeamCollectionReference listTeam = _$TeamCollectionReference(
    reference,
  );

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
    Object? date = _sentinel,
    Object? capacity = _sentinel,
    Object? cashPrize = _sentinel,
    Object? roundNumber = _sentinel,
    Object? image = _sentinel,
    Object? killPointTournament = _sentinel,
    Object? listTeam = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (date != _sentinel) "date": date as int,
      if (capacity != _sentinel) "capacity": capacity as int,
      if (cashPrize != _sentinel) "cashPrize": cashPrize as String,
      if (roundNumber != _sentinel) "roundNumber": roundNumber as int,
      if (image != _sentinel) "image": image as String?,
      if (killPointTournament != _sentinel)
        "killPointTournament": killPointTournament as int,
      if (listTeam != _sentinel) "listTeam": listTeam as List<Team>,
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
  TournamentQuery whereDate({
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
  TournamentQuery whereListTeam({
    List<Team>? isEqualTo,
    List<Team>? isNotEqualTo,
    List<Team>? isLessThan,
    List<Team>? isLessThanOrEqualTo,
    List<Team>? isGreaterThan,
    List<Team>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Team>? arrayContainsAny,
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

  TournamentQuery orderByDate({
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

  TournamentQuery orderByListTeam({
    bool descending = false,
    List<Team> startAt,
    List<Team> startAfter,
    List<Team> endAt,
    List<Team> endBefore,
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

  TournamentQuery whereDate({
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
        'date',
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

  TournamentQuery whereListTeam({
    List<Team>? isEqualTo,
    List<Team>? isNotEqualTo,
    List<Team>? isLessThan,
    List<Team>? isLessThanOrEqualTo,
    List<Team>? isGreaterThan,
    List<Team>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Team>? arrayContainsAny,
  }) {
    return _$TournamentQuery(
      reference.where(
        'listTeam',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
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

  TournamentQuery orderByDate({
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
    var query = reference.orderBy('date', descending: false);

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

  TournamentQuery orderByListTeam({
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
    var query = reference.orderBy('listTeam', descending: false);

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

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class TeamCollectionReference
    implements TeamQuery, FirestoreCollectionReference<TeamQuerySnapshot> {
  factory TeamCollectionReference(
    DocumentReference<Tournament> parent,
  ) = _$TeamCollectionReference;

  static Team fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Team.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Team value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [TournamentDocumentReference] if this is a subcollection.
  TournamentDocumentReference get parent;

  @override
  TeamDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TeamDocumentReference> add(Team value);
}

class _$TeamCollectionReference extends _$TeamQuery
    implements TeamCollectionReference {
  factory _$TeamCollectionReference(
    DocumentReference<Tournament> parent,
  ) {
    return _$TeamCollectionReference._(
      TournamentDocumentReference(parent),
      parent.collection('listTeam').withConverter(
            fromFirestore: TeamCollectionReference.fromFirestore,
            toFirestore: TeamCollectionReference.toFirestore,
          ),
    );
  }

  _$TeamCollectionReference._(
    this.parent,
    CollectionReference<Team> reference,
  ) : super(reference, reference);

  @override
  final TournamentDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Team> get reference =>
      super.reference as CollectionReference<Team>;

  @override
  TeamDocumentReference doc([String? id]) {
    return TeamDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TeamDocumentReference> add(Team value) {
    return reference.add(value).then((ref) => TeamDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TeamCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TeamDocumentReference
    extends FirestoreDocumentReference<TeamDocumentSnapshot> {
  factory TeamDocumentReference(DocumentReference<Team> reference) =
      _$TeamDocumentReference;

  DocumentReference<Team> get reference;

  /// A reference to the [TeamCollectionReference] containing this document.
  TeamCollectionReference get parent {
    return _$TeamCollectionReference(
      reference.parent.parent!.withConverter<Tournament>(
        fromFirestore: TournamentCollectionReference.fromFirestore,
        toFirestore: TournamentCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<TeamDocumentSnapshot> snapshots();

  @override
  Future<TeamDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    List<MemberTournament> listMemberTournament,
    String? teamCode,
    bool isDisqualified,
  });

  Future<void> set(Team value);
}

class _$TeamDocumentReference
    extends FirestoreDocumentReference<TeamDocumentSnapshot>
    implements TeamDocumentReference {
  _$TeamDocumentReference(this.reference);

  @override
  final DocumentReference<Team> reference;

  /// A reference to the [TeamCollectionReference] containing this document.
  TeamCollectionReference get parent {
    return _$TeamCollectionReference(
      reference.parent.parent!.withConverter<Tournament>(
        fromFirestore: TournamentCollectionReference.fromFirestore,
        toFirestore: TournamentCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<TeamDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TeamDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TeamDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TeamDocumentSnapshot._(
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
    Object? listMemberTournament = _sentinel,
    Object? teamCode = _sentinel,
    Object? isDisqualified = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (listMemberTournament != _sentinel)
        "listMemberTournament": listMemberTournament as List<MemberTournament>,
      if (teamCode != _sentinel) "teamCode": teamCode as String?,
      if (isDisqualified != _sentinel) "isDisqualified": isDisqualified as bool,
    };

    return reference.update(json);
  }

  Future<void> set(Team value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TeamDocumentSnapshot extends FirestoreDocumentSnapshot {
  TeamDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Team> snapshot;

  @override
  TeamDocumentReference get reference {
    return TeamDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Team? data;
}

abstract class TeamQuery implements QueryReference<TeamQuerySnapshot> {
  @override
  TeamQuery limit(int limit);

  @override
  TeamQuery limitToLast(int limit);

  TeamQuery whereName({
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
  TeamQuery whereListMemberTournament({
    List<MemberTournament>? isEqualTo,
    List<MemberTournament>? isNotEqualTo,
    List<MemberTournament>? isLessThan,
    List<MemberTournament>? isLessThanOrEqualTo,
    List<MemberTournament>? isGreaterThan,
    List<MemberTournament>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<MemberTournament>? arrayContainsAny,
  });
  TeamQuery whereTeamCode({
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
  TeamQuery whereIsDisqualified({
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

  TeamQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  });

  TeamQuery orderByListMemberTournament({
    bool descending = false,
    List<MemberTournament> startAt,
    List<MemberTournament> startAfter,
    List<MemberTournament> endAt,
    List<MemberTournament> endBefore,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  });

  TeamQuery orderByTeamCode({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  });

  TeamQuery orderByIsDisqualified({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  });
}

class _$TeamQuery extends QueryReference<TeamQuerySnapshot>
    implements TeamQuery {
  _$TeamQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Team> reference;

  TeamQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Team> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TeamQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TeamDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TeamDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return TeamQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TeamQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TeamQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TeamQuery limit(int limit) {
    return _$TeamQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TeamQuery limitToLast(int limit) {
    return _$TeamQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TeamQuery whereName({
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
    return _$TeamQuery(
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

  TeamQuery whereListMemberTournament({
    List<MemberTournament>? isEqualTo,
    List<MemberTournament>? isNotEqualTo,
    List<MemberTournament>? isLessThan,
    List<MemberTournament>? isLessThanOrEqualTo,
    List<MemberTournament>? isGreaterThan,
    List<MemberTournament>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<MemberTournament>? arrayContainsAny,
  }) {
    return _$TeamQuery(
      reference.where(
        'listMemberTournament',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  TeamQuery whereTeamCode({
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
    return _$TeamQuery(
      reference.where(
        'teamCode',
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

  TeamQuery whereIsDisqualified({
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
    return _$TeamQuery(
      reference.where(
        'isDisqualified',
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

  TeamQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
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

    return _$TeamQuery(query, _collection);
  }

  TeamQuery orderByListMemberTournament({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('listMemberTournament', descending: false);

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

    return _$TeamQuery(query, _collection);
  }

  TeamQuery orderByTeamCode({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('teamCode', descending: false);

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

    return _$TeamQuery(query, _collection);
  }

  TeamQuery orderByIsDisqualified({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeamDocumentSnapshot? startAtDocument,
    TeamDocumentSnapshot? endAtDocument,
    TeamDocumentSnapshot? endBeforeDocument,
    TeamDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isDisqualified', descending: false);

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

    return _$TeamQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TeamQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TeamQuerySnapshot
    extends FirestoreQuerySnapshot<TeamQueryDocumentSnapshot> {
  TeamQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Team> snapshot;

  @override
  final List<TeamQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TeamDocumentSnapshot>> docChanges;
}

class TeamQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements TeamDocumentSnapshot {
  TeamQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Team> snapshot;

  @override
  TeamDocumentReference get reference {
    return TeamDocumentReference(snapshot.reference);
  }

  @override
  final Team data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      name: json['name'] as String,
      date: json['date'] as int,
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
      ..image = json['image'] as String?
      ..listTeam = (json['listTeam'] as List<dynamic>)
          .map((e) => Team.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'name': instance.name,
      'date': instance.date,
      'game': _$GameNameEnumMap[instance.game],
      'server': _$ServerTypeEnumMap[instance.server],
      'tournamentType': instance.tournamentType.toJson(),
      'capacity': instance.capacity,
      'cashPrize': instance.cashPrize,
      'roundNumber': instance.roundNumber,
      'state': _$TournamentStateEnumMap[instance.state],
      'image': instance.image,
      'killPointTournament': instance.killPointTournament,
      'listTeam': instance.listTeam.map((e) => e.toJson()).toList(),
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
