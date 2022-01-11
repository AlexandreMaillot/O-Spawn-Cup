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
    return _$TeamToJson(value);
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
      firestore.collection('Team').withConverter(
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

  @override
  Stream<TeamDocumentSnapshot> snapshots();

  @override
  Future<TeamDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    List<MemberTournament> listMemberTournament,
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

Team _$TeamFromJson(Map<String, dynamic> json) => Team(
      name: json['name'] as String,
    )
      ..listMemberTournament = (json['listMemberTournament'] as List<dynamic>)
          .map((e) => MemberTournament.fromJson(e as Map<String, dynamic>))
          .toList()
      ..teamCode = json['teamCode'] as String
      ..isDisqualified = json['isDisqualified'] as bool;

Map<String, dynamic> _$TeamToJson(Team instance) => <String, dynamic>{
      'name': instance.name,
      'listMemberTournament': instance.listMemberTournament,
      'teamCode': instance.teamCode,
      'isDisqualified': instance.isDisqualified,
    };
