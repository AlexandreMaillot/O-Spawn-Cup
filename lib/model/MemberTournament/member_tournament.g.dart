// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_tournament.dart';

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
abstract class MemberTournamentCollectionReference
    implements
        MemberTournamentQuery,
        FirestoreCollectionReference<MemberTournamentQuerySnapshot> {
  factory MemberTournamentCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$MemberTournamentCollectionReference;

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
    return _$MemberTournamentToJson(value);
  }

  @override
  MemberTournamentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MemberTournamentDocumentReference> add(MemberTournament value);
}

class _$MemberTournamentCollectionReference extends _$MemberTournamentQuery
    implements MemberTournamentCollectionReference {
  factory _$MemberTournamentCollectionReference(
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$MemberTournamentCollectionReference._(
      firestore.collection('MemberTournaments').withConverter(
            fromFirestore: MemberTournamentCollectionReference.fromFirestore,
            toFirestore: MemberTournamentCollectionReference.toFirestore,
          ),
    );
  }

  _$MemberTournamentCollectionReference._(
    CollectionReference<MemberTournament> reference,
  ) : super(reference, reference);

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
    return _$MemberTournamentCollectionReference(reference.firestore);
  }

  late final TeamCollectionReference teams = _$TeamCollectionReference(
    reference,
  );

  late final TournamentCollectionReference tournaments =
      _$TournamentCollectionReference(
    reference,
  );

  @override
  Stream<MemberTournamentDocumentSnapshot> snapshots();

  @override
  Future<MemberTournamentDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String gamerTag,
    List<RoundClassementMember> listRoundClassementMember,
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
    return _$MemberTournamentCollectionReference(reference.firestore);
  }

  late final TeamCollectionReference teams = _$TeamCollectionReference(
    reference,
  );

  late final TournamentCollectionReference tournaments =
      _$TournamentCollectionReference(
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
    Object? gamerTag = _sentinel,
    Object? listRoundClassementMember = _sentinel,
  }) async {
    final json = {
      if (gamerTag != _sentinel) "gamerTag": gamerTag as String,
      if (listRoundClassementMember != _sentinel)
        "listRoundClassementMember":
            listRoundClassementMember as List<RoundClassementMember>,
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
  MemberTournamentQuery whereListRoundClassementMember({
    List<RoundClassementMember>? isEqualTo,
    List<RoundClassementMember>? isNotEqualTo,
    List<RoundClassementMember>? isLessThan,
    List<RoundClassementMember>? isLessThanOrEqualTo,
    List<RoundClassementMember>? isGreaterThan,
    List<RoundClassementMember>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<RoundClassementMember>? arrayContainsAny,
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

  MemberTournamentQuery orderByListRoundClassementMember({
    bool descending = false,
    List<RoundClassementMember> startAt,
    List<RoundClassementMember> startAfter,
    List<RoundClassementMember> endAt,
    List<RoundClassementMember> endBefore,
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

  MemberTournamentQuery whereListRoundClassementMember({
    List<RoundClassementMember>? isEqualTo,
    List<RoundClassementMember>? isNotEqualTo,
    List<RoundClassementMember>? isLessThan,
    List<RoundClassementMember>? isLessThanOrEqualTo,
    List<RoundClassementMember>? isGreaterThan,
    List<RoundClassementMember>? isGreaterThanOrEqualTo,
    bool? isNull,
    List<RoundClassementMember>? arrayContainsAny,
  }) {
    return _$MemberTournamentQuery(
      reference.where(
        'listRoundClassementMember',
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

  MemberTournamentQuery orderByListRoundClassementMember({
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
    var query =
        reference.orderBy('listRoundClassementMember', descending: false);

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
abstract class TeamCollectionReference
    implements TeamQuery, FirestoreCollectionReference<TeamQuerySnapshot> {
  factory TeamCollectionReference(
    DocumentReference<MemberTournament> parent,
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

  /// A reference to the containing [MemberTournamentDocumentReference] if this is a subcollection.
  MemberTournamentDocumentReference get parent;

  @override
  TeamDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TeamDocumentReference> add(Team value);
}

class _$TeamCollectionReference extends _$TeamQuery
    implements TeamCollectionReference {
  factory _$TeamCollectionReference(
    DocumentReference<MemberTournament> parent,
  ) {
    return _$TeamCollectionReference._(
      MemberTournamentDocumentReference(parent),
      parent.collection('Teams').withConverter(
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
  final MemberTournamentDocumentReference parent;

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
      reference.parent.parent!.withConverter<MemberTournament>(
        fromFirestore: MemberTournamentCollectionReference.fromFirestore,
        toFirestore: MemberTournamentCollectionReference.toFirestore,
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
      reference.parent.parent!.withConverter<MemberTournament>(
        fromFirestore: MemberTournamentCollectionReference.fromFirestore,
        toFirestore: MemberTournamentCollectionReference.toFirestore,
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

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class TournamentCollectionReference
    implements
        TournamentQuery,
        FirestoreCollectionReference<TournamentQuerySnapshot> {
  factory TournamentCollectionReference(
    DocumentReference<MemberTournament> parent,
  ) = _$TournamentCollectionReference;

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

  /// A reference to the containing [MemberTournamentDocumentReference] if this is a subcollection.
  MemberTournamentDocumentReference get parent;

  @override
  TournamentDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<TournamentDocumentReference> add(Tournament value);
}

class _$TournamentCollectionReference extends _$TournamentQuery
    implements TournamentCollectionReference {
  factory _$TournamentCollectionReference(
    DocumentReference<MemberTournament> parent,
  ) {
    return _$TournamentCollectionReference._(
      MemberTournamentDocumentReference(parent),
      parent.collection('Tournaments').withConverter(
            fromFirestore: TournamentCollectionReference.fromFirestore,
            toFirestore: TournamentCollectionReference.toFirestore,
          ),
    );
  }

  _$TournamentCollectionReference._(
    this.parent,
    CollectionReference<Tournament> reference,
  ) : super(reference, reference);

  @override
  final MemberTournamentDocumentReference parent;

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
    return _$TournamentCollectionReference(
      reference.parent.parent!.withConverter<MemberTournament>(
        fromFirestore: MemberTournamentCollectionReference.fromFirestore,
        toFirestore: MemberTournamentCollectionReference.toFirestore,
      ),
    );
  }

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
    List<Team>? listTeam,
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
    return _$TournamentCollectionReference(
      reference.parent.parent!.withConverter<MemberTournament>(
        fromFirestore: MemberTournamentCollectionReference.fromFirestore,
        toFirestore: MemberTournamentCollectionReference.toFirestore,
      ),
    );
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
      if (listTeam != _sentinel) "listTeam": listTeam as List<Team>?,
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
    List<Team>? startAt,
    List<Team>? startAfter,
    List<Team>? endAt,
    List<Team>? endBefore,
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

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberTournament _$MemberTournamentFromJson(Map<String, dynamic> json) =>
    MemberTournament(
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
      tournament:
          Tournament.fromJson(json['tournament'] as Map<String, dynamic>),
      gamerTag: json['gamerTag'] as String,
      role: $enumDecode(_$RoleTypeEnumMap, json['role']),
    )
      ..team = Team.fromJson(json['team'] as Map<String, dynamic>)
      ..listRoundClassementMember = (json['listRoundClassementMember']
              as List<dynamic>)
          .map((e) => RoundClassementMember.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$MemberTournamentToJson(MemberTournament instance) =>
    <String, dynamic>{
      'member': instance.member,
      'tournament': instance.tournament,
      'gamerTag': instance.gamerTag,
      'role': _$RoleTypeEnumMap[instance.role],
      'team': instance.team,
      'listRoundClassementMember': instance.listRoundClassementMember,
    };

const _$RoleTypeEnumMap = {
  RoleType.leader: 'leader',
  RoleType.player: 'player',
};
