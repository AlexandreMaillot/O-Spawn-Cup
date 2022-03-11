// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_classement_tournament.dart';

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
abstract class TeamClassementTournamentCollectionReference
    implements
        TeamClassementTournamentQuery,
        FirestoreCollectionReference<TeamClassementTournamentQuerySnapshot> {
  factory TeamClassementTournamentCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TeamClassementTournamentCollectionReference;

  static TeamClassementTournament fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return TeamClassementTournament.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    TeamClassementTournament value,
    SetOptions? options,
  ) {
    return _$TeamClassementTournamentToJson(value);
  }

  @override
  TeamClassementTournamentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TeamClassementTournamentDocumentReference> add(
      TeamClassementTournament value);
}

class _$TeamClassementTournamentCollectionReference
    extends _$TeamClassementTournamentQuery
    implements TeamClassementTournamentCollectionReference {
  factory _$TeamClassementTournamentCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TeamClassementTournamentCollectionReference._(
      firestore.collection('TeamClassementTournament').withConverter(
            fromFirestore:
                TeamClassementTournamentCollectionReference.fromFirestore,
            toFirestore:
                TeamClassementTournamentCollectionReference.toFirestore,
          ),
    );
  }

  _$TeamClassementTournamentCollectionReference._(
    CollectionReference<TeamClassementTournament> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<TeamClassementTournament> get reference =>
      super.reference as CollectionReference<TeamClassementTournament>;

  @override
  TeamClassementTournamentDocumentReference doc([String? id]) {
    return TeamClassementTournamentDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<TeamClassementTournamentDocumentReference> add(
      TeamClassementTournament value) {
    return reference
        .add(value)
        .then((ref) => TeamClassementTournamentDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$TeamClassementTournamentCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class TeamClassementTournamentDocumentReference
    extends FirestoreDocumentReference<
        TeamClassementTournamentDocumentSnapshot> {
  factory TeamClassementTournamentDocumentReference(
          DocumentReference<TeamClassementTournament> reference) =
      _$TeamClassementTournamentDocumentReference;

  DocumentReference<TeamClassementTournament> get reference;

  /// A reference to the [TeamClassementTournamentCollectionReference] containing this document.
  TeamClassementTournamentCollectionReference get parent {
    return _$TeamClassementTournamentCollectionReference(reference.firestore);
  }

  @override
  Stream<TeamClassementTournamentDocumentSnapshot> snapshots();

  @override
  Future<TeamClassementTournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int rang,
    int totalPoints,
  });

  Future<void> set(TeamClassementTournament value);
}

class _$TeamClassementTournamentDocumentReference
    extends FirestoreDocumentReference<TeamClassementTournamentDocumentSnapshot>
    implements TeamClassementTournamentDocumentReference {
  _$TeamClassementTournamentDocumentReference(this.reference);

  @override
  final DocumentReference<TeamClassementTournament> reference;

  /// A reference to the [TeamClassementTournamentCollectionReference] containing this document.
  TeamClassementTournamentCollectionReference get parent {
    return _$TeamClassementTournamentCollectionReference(reference.firestore);
  }

  @override
  Stream<TeamClassementTournamentDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return TeamClassementTournamentDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<TeamClassementTournamentDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return TeamClassementTournamentDocumentSnapshot._(
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
    Object? totalPoints = _sentinel,
  }) async {
    final json = {
      if (rang != _sentinel) "rang": rang as int,
      if (totalPoints != _sentinel) "totalPoints": totalPoints as int,
    };

    return reference.update(json);
  }

  Future<void> set(TeamClassementTournament value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamClassementTournamentDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class TeamClassementTournamentDocumentSnapshot
    extends FirestoreDocumentSnapshot {
  TeamClassementTournamentDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<TeamClassementTournament> snapshot;

  @override
  TeamClassementTournamentDocumentReference get reference {
    return TeamClassementTournamentDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final TeamClassementTournament? data;
}

abstract class TeamClassementTournamentQuery
    implements QueryReference<TeamClassementTournamentQuerySnapshot> {
  @override
  TeamClassementTournamentQuery limit(int limit);

  @override
  TeamClassementTournamentQuery limitToLast(int limit);

  TeamClassementTournamentQuery whereRang({
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
  TeamClassementTournamentQuery whereTotalPoints({
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

  TeamClassementTournamentQuery orderByRang({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TeamClassementTournamentDocumentSnapshot? startAtDocument,
    TeamClassementTournamentDocumentSnapshot? endAtDocument,
    TeamClassementTournamentDocumentSnapshot? endBeforeDocument,
    TeamClassementTournamentDocumentSnapshot? startAfterDocument,
  });

  TeamClassementTournamentQuery orderByTotalPoints({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    TeamClassementTournamentDocumentSnapshot? startAtDocument,
    TeamClassementTournamentDocumentSnapshot? endAtDocument,
    TeamClassementTournamentDocumentSnapshot? endBeforeDocument,
    TeamClassementTournamentDocumentSnapshot? startAfterDocument,
  });
}

class _$TeamClassementTournamentQuery
    extends QueryReference<TeamClassementTournamentQuerySnapshot>
    implements TeamClassementTournamentQuery {
  _$TeamClassementTournamentQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<TeamClassementTournament> reference;

  TeamClassementTournamentQuerySnapshot _decodeSnapshot(
    QuerySnapshot<TeamClassementTournament> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return TeamClassementTournamentQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<TeamClassementTournamentDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: TeamClassementTournamentDocumentSnapshot._(
            change.doc, change.doc.data()),
      );
    }).toList();

    return TeamClassementTournamentQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<TeamClassementTournamentQuerySnapshot> snapshots(
      [SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<TeamClassementTournamentQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  TeamClassementTournamentQuery limit(int limit) {
    return _$TeamClassementTournamentQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  TeamClassementTournamentQuery limitToLast(int limit) {
    return _$TeamClassementTournamentQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  TeamClassementTournamentQuery whereRang({
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
    return _$TeamClassementTournamentQuery(
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

  TeamClassementTournamentQuery whereTotalPoints({
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
    return _$TeamClassementTournamentQuery(
      reference.where(
        'totalPoints',
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

  TeamClassementTournamentQuery orderByRang({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeamClassementTournamentDocumentSnapshot? startAtDocument,
    TeamClassementTournamentDocumentSnapshot? endAtDocument,
    TeamClassementTournamentDocumentSnapshot? endBeforeDocument,
    TeamClassementTournamentDocumentSnapshot? startAfterDocument,
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

    return _$TeamClassementTournamentQuery(query, _collection);
  }

  TeamClassementTournamentQuery orderByTotalPoints({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    TeamClassementTournamentDocumentSnapshot? startAtDocument,
    TeamClassementTournamentDocumentSnapshot? endAtDocument,
    TeamClassementTournamentDocumentSnapshot? endBeforeDocument,
    TeamClassementTournamentDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('totalPoints', descending: descending);

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

    return _$TeamClassementTournamentQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$TeamClassementTournamentQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class TeamClassementTournamentQuerySnapshot extends FirestoreQuerySnapshot<
    TeamClassementTournamentQueryDocumentSnapshot> {
  TeamClassementTournamentQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<TeamClassementTournament> snapshot;

  @override
  final List<TeamClassementTournamentQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<TeamClassementTournamentDocumentSnapshot>>
      docChanges;
}

class TeamClassementTournamentQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements TeamClassementTournamentDocumentSnapshot {
  TeamClassementTournamentQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<TeamClassementTournament> snapshot;

  @override
  TeamClassementTournamentDocumentReference get reference {
    return TeamClassementTournamentDocumentReference(snapshot.reference);
  }

  @override
  final TeamClassementTournament data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamClassementTournament _$TeamClassementTournamentFromJson(
        Map<String, dynamic> json) =>
    TeamClassementTournament(
      tournament:
          Tournament.fromJson(json['tournament'] as Map<String, dynamic>),
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      rang: json['rang'] as int,
      totalPoints: json['totalPoints'] as int,
    );

Map<String, dynamic> _$TeamClassementTournamentToJson(
        TeamClassementTournament instance) =>
    <String, dynamic>{
      'tournament': instance.tournament,
      'team': instance.team,
      'rang': instance.rang,
      'totalPoints': instance.totalPoints,
    };
