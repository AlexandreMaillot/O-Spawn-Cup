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

  late final TeamCollectionReference teams = _$TeamCollectionReference(
    reference,
  );

  late final RoundCollectionReference rounds = _$RoundCollectionReference(
    reference,
  );

  @override
  Stream<TournamentDocumentSnapshot> snapshots();

  @override
  Future<TournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? documentId,
    String name,
    int capacity,
    List<String> cashPrize,
    List<String> listCodesGames,
    int roundNumber,
    String? imageUrl,
    String? imageName,
    int killPointTournament,
    int? pointPerRangTournament,
    int? rangStartTournament,
    List<Object?> props,
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

  late final TeamCollectionReference teams = _$TeamCollectionReference(
    reference,
  );

  late final RoundCollectionReference rounds = _$RoundCollectionReference(
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
    Object? documentId = _sentinel,
    Object? name = _sentinel,
    Object? capacity = _sentinel,
    Object? cashPrize = _sentinel,
    Object? listCodesGames = _sentinel,
    Object? roundNumber = _sentinel,
    Object? imageUrl = _sentinel,
    Object? imageName = _sentinel,
    Object? killPointTournament = _sentinel,
    Object? pointPerRangTournament = _sentinel,
    Object? rangStartTournament = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (documentId != _sentinel) "documentId": documentId as String?,
      if (name != _sentinel) "name": name as String,
      if (capacity != _sentinel) "capacity": capacity as int,
      if (cashPrize != _sentinel) "cashPrize": cashPrize as List<String>,
      if (listCodesGames != _sentinel)
        "listCodesGames": listCodesGames as List<String>,
      if (roundNumber != _sentinel) "roundNumber": roundNumber as int,
      if (imageUrl != _sentinel) "imageUrl": imageUrl as String?,
      if (imageName != _sentinel) "imageName": imageName as String?,
      if (killPointTournament != _sentinel)
        "killPointTournament": killPointTournament as int,
      if (pointPerRangTournament != _sentinel)
        "pointPerRangTournament": pointPerRangTournament as int?,
      if (rangStartTournament != _sentinel)
        "rangStartTournament": rangStartTournament as int?,
      if (props != _sentinel) "props": props as List<Object?>,
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

  TournamentQuery whereDocumentId({
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
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  });
  TournamentQuery whereListCodesGames({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
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
  TournamentQuery whereImageUrl({
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
  TournamentQuery whereImageName({
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
  TournamentQuery wherePointPerRangTournament({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  TournamentQuery whereRangStartTournament({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  });
  TournamentQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  });

  TournamentQuery orderByDocumentId({
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
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByListCodesGames({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
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

  TournamentQuery orderByImageUrl({
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

  TournamentQuery orderByImageName({
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

  TournamentQuery orderByPointPerRangTournament({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByRangStartTournament({
    bool descending = false,
    int? startAt,
    int? startAfter,
    int? endAt,
    int? endBefore,
    TournamentDocumentSnapshot? startAtDocument,
    TournamentDocumentSnapshot? endAtDocument,
    TournamentDocumentSnapshot? endBeforeDocument,
    TournamentDocumentSnapshot? startAfterDocument,
  });

  TournamentQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
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

  TournamentQuery whereDocumentId({
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
        'documentId',
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
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
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
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  TournamentQuery whereListCodesGames({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? arrayContainsAny,
  }) {
    return _$TournamentQuery(
      reference.where(
        'listCodesGames',
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

  TournamentQuery whereImageUrl({
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
        'imageUrl',
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

  TournamentQuery whereImageName({
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
        'imageName',
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

  TournamentQuery wherePointPerRangTournament({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$TournamentQuery(
      reference.where(
        'pointPerRangTournament',
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

  TournamentQuery whereRangStartTournament({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int?>? whereIn,
    List<int?>? whereNotIn,
  }) {
    return _$TournamentQuery(
      reference.where(
        'rangStartTournament',
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

  TournamentQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  }) {
    return _$TournamentQuery(
      reference.where(
        'props',
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

  TournamentQuery orderByDocumentId({
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
    var query = reference.orderBy('documentId', descending: descending);

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
    var query = reference.orderBy('capacity', descending: descending);

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
    var query = reference.orderBy('cashPrize', descending: descending);

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

  TournamentQuery orderByListCodesGames({
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
    var query = reference.orderBy('listCodesGames', descending: descending);

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
    var query = reference.orderBy('roundNumber', descending: descending);

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

  TournamentQuery orderByImageUrl({
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
    var query = reference.orderBy('imageUrl', descending: descending);

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

  TournamentQuery orderByImageName({
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
    var query = reference.orderBy('imageName', descending: descending);

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
    var query =
        reference.orderBy('killPointTournament', descending: descending);

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

  TournamentQuery orderByPointPerRangTournament({
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
    var query =
        reference.orderBy('pointPerRangTournament', descending: descending);

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

  TournamentQuery orderByRangStartTournament({
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
    var query =
        reference.orderBy('rangStartTournament', descending: descending);

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

  TournamentQuery orderByProps({
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
    var query = reference.orderBy('props', descending: descending);

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
      parent.collection('teams').withConverter(
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

  late final MemberTournamentCollectionReference membersTournament =
      _$MemberTournamentCollectionReference(
    reference,
  );

  @override
  Stream<TeamDocumentSnapshot> snapshots();

  @override
  Future<TeamDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? documentId,
    List<MemberTournament> listMemberTournament,
    String name,
    String teamCode,
    bool isDisqualified,
    List<Object?> props,
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

  late final MemberTournamentCollectionReference membersTournament =
      _$MemberTournamentCollectionReference(
    reference,
  );

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
    Object? documentId = _sentinel,
    Object? listMemberTournament = _sentinel,
    Object? name = _sentinel,
    Object? teamCode = _sentinel,
    Object? isDisqualified = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (documentId != _sentinel) "documentId": documentId as String?,
      if (listMemberTournament != _sentinel)
        "listMemberTournament": listMemberTournament as List<MemberTournament>,
      if (name != _sentinel) "name": name as String,
      if (teamCode != _sentinel) "teamCode": teamCode as String,
      if (isDisqualified != _sentinel) "isDisqualified": isDisqualified as bool,
      if (props != _sentinel) "props": props as List<Object?>,
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

  TeamQuery whereDocumentId({
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
  TeamQuery whereTeamCode({
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
  TeamQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  });

  TeamQuery orderByDocumentId({
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

  TeamQuery orderByTeamCode({
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

  TeamQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
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

  TeamQuery whereDocumentId({
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
        'documentId',
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

  TeamQuery whereTeamCode({
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

  TeamQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  }) {
    return _$TeamQuery(
      reference.where(
        'props',
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

  TeamQuery orderByDocumentId({
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
    var query = reference.orderBy('documentId', descending: descending);

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
    var query =
        reference.orderBy('listMemberTournament', descending: descending);

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
    var query = reference.orderBy('teamCode', descending: descending);

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
    var query = reference.orderBy('isDisqualified', descending: descending);

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

  TeamQuery orderByProps({
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
    var query = reference.orderBy('props', descending: descending);

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

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RoundCollectionReference
    implements RoundQuery, FirestoreCollectionReference<RoundQuerySnapshot> {
  factory RoundCollectionReference(
    DocumentReference<Tournament> parent,
  ) = _$RoundCollectionReference;

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
    return value.toJson();
  }

  /// A reference to the containing [TournamentDocumentReference] if this is a subcollection.
  TournamentDocumentReference get parent;

  @override
  RoundDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RoundDocumentReference> add(Round value);
}

class _$RoundCollectionReference extends _$RoundQuery
    implements RoundCollectionReference {
  factory _$RoundCollectionReference(
    DocumentReference<Tournament> parent,
  ) {
    return _$RoundCollectionReference._(
      TournamentDocumentReference(parent),
      parent.collection('rounds').withConverter(
            fromFirestore: RoundCollectionReference.fromFirestore,
            toFirestore: RoundCollectionReference.toFirestore,
          ),
    );
  }

  _$RoundCollectionReference._(
    this.parent,
    CollectionReference<Round> reference,
  ) : super(reference, reference);

  @override
  final TournamentDocumentReference parent;

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
    return _$RoundCollectionReference(
      reference.parent.parent!.withConverter<Tournament>(
        fromFirestore: TournamentCollectionReference.fromFirestore,
        toFirestore: TournamentCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RoundDocumentSnapshot> snapshots();

  @override
  Future<RoundDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int roundNumber,
  });

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
    return _$RoundCollectionReference(
      reference.parent.parent!.withConverter<Tournament>(
        fromFirestore: TournamentCollectionReference.fromFirestore,
        toFirestore: TournamentCollectionReference.toFirestore,
      ),
    );
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

  Future<void> update({
    Object? roundNumber = _sentinel,
  }) async {
    final json = {
      if (roundNumber != _sentinel) "roundNumber": roundNumber as int,
    };

    return reference.update(json);
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

  RoundQuery whereRoundNumber({
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

  RoundQuery orderByRoundNumber({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RoundDocumentSnapshot? startAtDocument,
    RoundDocumentSnapshot? endAtDocument,
    RoundDocumentSnapshot? endBeforeDocument,
    RoundDocumentSnapshot? startAfterDocument,
  });
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

  RoundQuery whereRoundNumber({
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
    return _$RoundQuery(
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

  RoundQuery orderByRoundNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoundDocumentSnapshot? startAtDocument,
    RoundDocumentSnapshot? endAtDocument,
    RoundDocumentSnapshot? endBeforeDocument,
    RoundDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('roundNumber', descending: descending);

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

    return _$RoundQuery(query, _collection);
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

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MemberTournamentCollectionReference
    implements
        MemberTournamentQuery,
        FirestoreCollectionReference<MemberTournamentQuerySnapshot> {
  factory MemberTournamentCollectionReference(
    DocumentReference<Team> parent,
  ) = _$MemberTournamentCollectionReference;

  static MemberTournament fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return MemberTournament.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    MemberTournament value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [TeamDocumentReference] if this is a subcollection.
  TeamDocumentReference get parent;

  @override
  MemberTournamentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MemberTournamentDocumentReference> add(MemberTournament value);
}

class _$MemberTournamentCollectionReference extends _$MemberTournamentQuery
    implements MemberTournamentCollectionReference {
  factory _$MemberTournamentCollectionReference(
    DocumentReference<Team> parent,
  ) {
    return _$MemberTournamentCollectionReference._(
      TeamDocumentReference(parent),
      parent.collection('membersTournament').withConverter(
            fromFirestore: MemberTournamentCollectionReference.fromFirestore,
            toFirestore: MemberTournamentCollectionReference.toFirestore,
          ),
    );
  }

  _$MemberTournamentCollectionReference._(
    this.parent,
    CollectionReference<MemberTournament> reference,
  ) : super(reference, reference);

  @override
  final TeamDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<MemberTournament> get reference =>
      super.reference as CollectionReference<MemberTournament>;

  @override
  MemberTournamentDocumentReference doc([String? id]) {
    return MemberTournamentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MemberTournamentDocumentReference> add(MemberTournament value) {
    return reference
        .add(value)
        .then((ref) => MemberTournamentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MemberTournamentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MemberTournamentDocumentReference
    extends FirestoreDocumentReference<MemberTournamentDocumentSnapshot> {
  factory MemberTournamentDocumentReference(
          DocumentReference<MemberTournament> reference) =
      _$MemberTournamentDocumentReference;

  DocumentReference<MemberTournament> get reference;

  /// A reference to the [MemberTournamentCollectionReference] containing this document.
  MemberTournamentCollectionReference get parent {
    return _$MemberTournamentCollectionReference(
      reference.parent.parent!.withConverter<Team>(
        fromFirestore: TeamCollectionReference.fromFirestore,
        toFirestore: TeamCollectionReference.toFirestore,
      ),
    );
  }

  late final MemberCollectionReference members = _$MemberCollectionReference(
    reference,
  );

  @override
  Stream<MemberTournamentDocumentSnapshot> snapshots();

  @override
  Future<MemberTournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? documentId,
    String gamerTag,
    List<Object?> props,
  });

  Future<void> set(MemberTournament value);
}

class _$MemberTournamentDocumentReference
    extends FirestoreDocumentReference<MemberTournamentDocumentSnapshot>
    implements MemberTournamentDocumentReference {
  _$MemberTournamentDocumentReference(this.reference);

  @override
  final DocumentReference<MemberTournament> reference;

  /// A reference to the [MemberTournamentCollectionReference] containing this document.
  MemberTournamentCollectionReference get parent {
    return _$MemberTournamentCollectionReference(
      reference.parent.parent!.withConverter<Team>(
        fromFirestore: TeamCollectionReference.fromFirestore,
        toFirestore: TeamCollectionReference.toFirestore,
      ),
    );
  }

  late final MemberCollectionReference members = _$MemberCollectionReference(
    reference,
  );

  @override
  Stream<MemberTournamentDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MemberTournamentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MemberTournamentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MemberTournamentDocumentSnapshot._(
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
    Object? documentId = _sentinel,
    Object? gamerTag = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (documentId != _sentinel) "documentId": documentId as String?,
      if (gamerTag != _sentinel) "gamerTag": gamerTag as String,
      if (props != _sentinel) "props": props as List<Object?>,
    };

    return reference.update(json);
  }

  Future<void> set(MemberTournament value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberTournamentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MemberTournamentDocumentSnapshot extends FirestoreDocumentSnapshot {
  MemberTournamentDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<MemberTournament> snapshot;

  @override
  MemberTournamentDocumentReference get reference {
    return MemberTournamentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final MemberTournament? data;
}

abstract class MemberTournamentQuery
    implements QueryReference<MemberTournamentQuerySnapshot> {
  @override
  MemberTournamentQuery limit(int limit);

  @override
  MemberTournamentQuery limitToLast(int limit);

  MemberTournamentQuery whereDocumentId({
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
  MemberTournamentQuery whereGamerTag({
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
  MemberTournamentQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  });

  MemberTournamentQuery orderByDocumentId({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    MemberTournamentDocumentSnapshot? startAtDocument,
    MemberTournamentDocumentSnapshot? endAtDocument,
    MemberTournamentDocumentSnapshot? endBeforeDocument,
    MemberTournamentDocumentSnapshot? startAfterDocument,
  });

  MemberTournamentQuery orderByGamerTag({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MemberTournamentDocumentSnapshot? startAtDocument,
    MemberTournamentDocumentSnapshot? endAtDocument,
    MemberTournamentDocumentSnapshot? endBeforeDocument,
    MemberTournamentDocumentSnapshot? startAfterDocument,
  });

  MemberTournamentQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
    MemberTournamentDocumentSnapshot? startAtDocument,
    MemberTournamentDocumentSnapshot? endAtDocument,
    MemberTournamentDocumentSnapshot? endBeforeDocument,
    MemberTournamentDocumentSnapshot? startAfterDocument,
  });
}

class _$MemberTournamentQuery
    extends QueryReference<MemberTournamentQuerySnapshot>
    implements MemberTournamentQuery {
  _$MemberTournamentQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<MemberTournament> reference;

  MemberTournamentQuerySnapshot _decodeSnapshot(
    QuerySnapshot<MemberTournament> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MemberTournamentQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MemberTournamentDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MemberTournamentDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MemberTournamentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MemberTournamentQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MemberTournamentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MemberTournamentQuery limit(int limit) {
    return _$MemberTournamentQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MemberTournamentQuery limitToLast(int limit) {
    return _$MemberTournamentQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MemberTournamentQuery whereDocumentId({
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
    return _$MemberTournamentQuery(
      reference.where(
        'documentId',
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

  MemberTournamentQuery whereGamerTag({
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
    return _$MemberTournamentQuery(
      reference.where(
        'gamerTag',
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

  MemberTournamentQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  }) {
    return _$MemberTournamentQuery(
      reference.where(
        'props',
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

  MemberTournamentQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberTournamentDocumentSnapshot? startAtDocument,
    MemberTournamentDocumentSnapshot? endAtDocument,
    MemberTournamentDocumentSnapshot? endBeforeDocument,
    MemberTournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('documentId', descending: descending);

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

    return _$MemberTournamentQuery(query, _collection);
  }

  MemberTournamentQuery orderByGamerTag({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberTournamentDocumentSnapshot? startAtDocument,
    MemberTournamentDocumentSnapshot? endAtDocument,
    MemberTournamentDocumentSnapshot? endBeforeDocument,
    MemberTournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('gamerTag', descending: descending);

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

    return _$MemberTournamentQuery(query, _collection);
  }

  MemberTournamentQuery orderByProps({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberTournamentDocumentSnapshot? startAtDocument,
    MemberTournamentDocumentSnapshot? endAtDocument,
    MemberTournamentDocumentSnapshot? endBeforeDocument,
    MemberTournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('props', descending: descending);

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

    return _$MemberTournamentQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MemberTournamentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MemberTournamentQuerySnapshot
    extends FirestoreQuerySnapshot<MemberTournamentQueryDocumentSnapshot> {
  MemberTournamentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<MemberTournament> snapshot;

  @override
  final List<MemberTournamentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MemberTournamentDocumentSnapshot>>
      docChanges;
}

class MemberTournamentQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements MemberTournamentDocumentSnapshot {
  MemberTournamentQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<MemberTournament> snapshot;

  @override
  MemberTournamentDocumentReference get reference {
    return MemberTournamentDocumentReference(snapshot.reference);
  }

  @override
  final MemberTournament data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MemberCollectionReference
    implements MemberQuery, FirestoreCollectionReference<MemberQuerySnapshot> {
  factory MemberCollectionReference(
    DocumentReference<MemberTournament> parent,
  ) = _$MemberCollectionReference;

  static Member fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Member.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Member value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [MemberTournamentDocumentReference] if this is a subcollection.
  MemberTournamentDocumentReference get parent;

  @override
  MemberDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MemberDocumentReference> add(Member value);
}

class _$MemberCollectionReference extends _$MemberQuery
    implements MemberCollectionReference {
  factory _$MemberCollectionReference(
    DocumentReference<MemberTournament> parent,
  ) {
    return _$MemberCollectionReference._(
      MemberTournamentDocumentReference(parent),
      parent.collection('member').withConverter(
            fromFirestore: MemberCollectionReference.fromFirestore,
            toFirestore: MemberCollectionReference.toFirestore,
          ),
    );
  }

  _$MemberCollectionReference._(
    this.parent,
    CollectionReference<Member> reference,
  ) : super(reference, reference);

  @override
  final MemberTournamentDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Member> get reference =>
      super.reference as CollectionReference<Member>;

  @override
  MemberDocumentReference doc([String? id]) {
    return MemberDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MemberDocumentReference> add(Member value) {
    return reference.add(value).then((ref) => MemberDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MemberCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MemberDocumentReference
    extends FirestoreDocumentReference<MemberDocumentSnapshot> {
  factory MemberDocumentReference(DocumentReference<Member> reference) =
      _$MemberDocumentReference;

  DocumentReference<Member> get reference;

  /// A reference to the [MemberCollectionReference] containing this document.
  MemberCollectionReference get parent {
    return _$MemberCollectionReference(
      reference.parent.parent!.withConverter<MemberTournament>(
        fromFirestore: MemberTournamentCollectionReference.fromFirestore,
        toFirestore: MemberTournamentCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<MemberDocumentSnapshot> snapshots();

  @override
  Future<MemberDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String pseudo,
    String uid,
    bool isAdmin,
    List<Object?> props,
  });

  Future<void> set(Member value);
}

class _$MemberDocumentReference
    extends FirestoreDocumentReference<MemberDocumentSnapshot>
    implements MemberDocumentReference {
  _$MemberDocumentReference(this.reference);

  @override
  final DocumentReference<Member> reference;

  /// A reference to the [MemberCollectionReference] containing this document.
  MemberCollectionReference get parent {
    return _$MemberCollectionReference(
      reference.parent.parent!.withConverter<MemberTournament>(
        fromFirestore: MemberTournamentCollectionReference.fromFirestore,
        toFirestore: MemberTournamentCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<MemberDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MemberDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MemberDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MemberDocumentSnapshot._(
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
    Object? pseudo = _sentinel,
    Object? uid = _sentinel,
    Object? isAdmin = _sentinel,
    Object? props = _sentinel,
  }) async {
    final json = {
      if (pseudo != _sentinel) "pseudo": pseudo as String,
      if (uid != _sentinel) "uid": uid as String,
      if (isAdmin != _sentinel) "isAdmin": isAdmin as bool,
      if (props != _sentinel) "props": props as List<Object?>,
    };

    return reference.update(json);
  }

  Future<void> set(Member value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MemberDocumentSnapshot extends FirestoreDocumentSnapshot {
  MemberDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Member> snapshot;

  @override
  MemberDocumentReference get reference {
    return MemberDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Member? data;
}

abstract class MemberQuery implements QueryReference<MemberQuerySnapshot> {
  @override
  MemberQuery limit(int limit);

  @override
  MemberQuery limitToLast(int limit);

  MemberQuery wherePseudo({
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
  MemberQuery whereUid({
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
  MemberQuery whereIsAdmin({
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
  MemberQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  });

  MemberQuery orderByPseudo({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  });

  MemberQuery orderByUid({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  });

  MemberQuery orderByIsAdmin({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  });

  MemberQuery orderByProps({
    bool descending = false,
    List<Object?> startAt,
    List<Object?> startAfter,
    List<Object?> endAt,
    List<Object?> endBefore,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  });
}

class _$MemberQuery extends QueryReference<MemberQuerySnapshot>
    implements MemberQuery {
  _$MemberQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Member> reference;

  MemberQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Member> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MemberQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MemberDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MemberDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MemberQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MemberQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MemberQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MemberQuery limit(int limit) {
    return _$MemberQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MemberQuery limitToLast(int limit) {
    return _$MemberQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MemberQuery wherePseudo({
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
    return _$MemberQuery(
      reference.where(
        'pseudo',
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

  MemberQuery whereUid({
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
    return _$MemberQuery(
      reference.where(
        'uid',
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

  MemberQuery whereIsAdmin({
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
    return _$MemberQuery(
      reference.where(
        'isAdmin',
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

  MemberQuery whereProps({
    List<Object?>? isEqualTo,
    List<Object?>? isNotEqualTo,
    List<Object?>? isLessThan,
    List<Object?>? isLessThanOrEqualTo,
    List<Object?>? isGreaterThan,
    List<Object?>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<Object?>? arrayContainsAny,
  }) {
    return _$MemberQuery(
      reference.where(
        'props',
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

  MemberQuery orderByPseudo({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('pseudo', descending: descending);

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

    return _$MemberQuery(query, _collection);
  }

  MemberQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('uid', descending: descending);

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

    return _$MemberQuery(query, _collection);
  }

  MemberQuery orderByIsAdmin({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('isAdmin', descending: descending);

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

    return _$MemberQuery(query, _collection);
  }

  MemberQuery orderByProps({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MemberDocumentSnapshot? startAtDocument,
    MemberDocumentSnapshot? endAtDocument,
    MemberDocumentSnapshot? endBeforeDocument,
    MemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('props', descending: descending);

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

    return _$MemberQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MemberQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MemberQuerySnapshot
    extends FirestoreQuerySnapshot<MemberQueryDocumentSnapshot> {
  MemberQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Member> snapshot;

  @override
  final List<MemberQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MemberDocumentSnapshot>> docChanges;
}

class MemberQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements MemberDocumentSnapshot {
  MemberQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Member> snapshot;

  @override
  MemberDocumentReference get reference {
    return MemberDocumentReference(snapshot.reference);
  }

  @override
  final Member data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tournament _$TournamentFromJson(Map<String, dynamic> json) => Tournament(
      name: json['name'] as String,
      dateDebutTournois: json['dateDebutTournois'] == null
          ? null
          : DateTime.parse(json['dateDebutTournois'] as String),
      game: $enumDecode(_$GameNameEnumMap, json['game']),
      server: $enumDecode(_$ServerTypeEnumMap, json['server']),
      tournamentType: TournamentType.fromJson(
          json['tournamentType'] as Map<String, dynamic>),
      capacity: json['capacity'] as int,
      roundNumber: json['roundNumber'] as int,
      dateDebutInscription: json['dateDebutInscription'] == null
          ? null
          : DateTime.parse(json['dateDebutInscription'] as String),
      imageUrl: json['imageUrl'] as String?,
      imageName: json['imageName'] as String?,
      cashPrize: json['cashPrize'] == null
          ? const <String>[]
          : Tournament._listFromJson(json['cashPrize'] as List),
      killPointTournament: json['killPointTournament'] as int,
      pointPerRangTournament: json['pointPerRangTournament'] as int?,
      rangStartTournament: json['rangStartTournament'] as int?,
      listCodesGames: Tournament._listFromJson(json['listCodesGames'] as List),
    )..state = $enumDecode(_$TournamentStateEnumMap, json['state']);

Map<String, dynamic> _$TournamentToJson(Tournament instance) =>
    <String, dynamic>{
      'name': instance.name,
      'dateDebutTournois': instance.dateDebutTournois?.toIso8601String(),
      'dateDebutInscription': instance.dateDebutInscription?.toIso8601String(),
      'game': _$GameNameEnumMap[instance.game],
      'server': _$ServerTypeEnumMap[instance.server],
      'tournamentType': instance.tournamentType.toJson(),
      'capacity': instance.capacity,
      'cashPrize': instance.cashPrize,
      'listCodesGames': instance.listCodesGames,
      'roundNumber': instance.roundNumber,
      'imageUrl': instance.imageUrl,
      'imageName': instance.imageName,
      'killPointTournament': instance.killPointTournament,
      'pointPerRangTournament': instance.pointPerRangTournament,
      'rangStartTournament': instance.rangStartTournament,
      'state': _$TournamentStateEnumMap[instance.state],
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
  TournamentState.inscriptionOuverte: 'inscriptionOuverte',
  TournamentState.inscriptionFermer: 'inscriptionFermer',
  TournamentState.enCours: 'enCours',
  TournamentState.annuler: 'annuler',
  TournamentState.terminer: 'terminer',
  TournamentState.complet: 'complet',
};
