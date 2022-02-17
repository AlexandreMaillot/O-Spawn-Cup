// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

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
abstract class TeamCollectionReference
    implements TeamQuery, FirestoreCollectionReference<TeamQuerySnapshot> {
  factory TeamCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$TeamCollectionReference;

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

  @override
  TeamDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TeamDocumentReference> add(Team value);
}

class _$TeamCollectionReference extends _$TeamQuery
    implements TeamCollectionReference {
  factory _$TeamCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$TeamCollectionReference._(
      firestore.collection('Teams').withConverter(
            fromFirestore: TeamCollectionReference.fromFirestore,
            toFirestore: TeamCollectionReference.toFirestore,
          ),
    );
  }

  _$TeamCollectionReference._(
    CollectionReference<Team> reference,
  ) : super(reference, reference);

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
    return _$TeamCollectionReference(reference.firestore);
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
    String name,
    String teamCode,
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
    return _$TeamCollectionReference(reference.firestore);
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
    Object? name = _sentinel,
    Object? teamCode = _sentinel,
    Object? isDisqualified = _sentinel,
  }) async {
    final json = {
      if (documentId != _sentinel) "documentId": documentId as String?,
      if (name != _sentinel) "name": name as String,
      if (teamCode != _sentinel) "teamCode": teamCode as String,
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
    var query = reference.orderBy('documentId', descending: false);

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
      parent.collection('membersTournaments').withConverter(
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

  @override
  Stream<MemberTournamentDocumentSnapshot> snapshots();

  @override
  Future<MemberTournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String gamerTag,
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
    Object? gamerTag = _sentinel,
  }) async {
    final json = {
      if (gamerTag != _sentinel) "gamerTag": gamerTag as String,
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
    var query = reference.orderBy('gamerTag', descending: false);

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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      name: json['name'] as String,
    )
      ..documentId = json['documentId'] as String?
      ..teamCode = json['teamCode'] as String
      ..isDisqualified = json['isDisqualified'] as bool;

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'teamCode': instance.teamCode,
      'isDisqualified': instance.isDisqualified,
    };
