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
      firestore.collection('MemberTournament').withConverter(
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
