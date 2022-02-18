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
    return value.toJson();
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
  }) async {
    final json = {
      if (documentId != _sentinel) "documentId": documentId as String?,
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
      parent.collection('members').withConverter(
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
  }) async {
    final json = {
      if (pseudo != _sentinel) "pseudo": pseudo as String,
      if (uid != _sentinel) "uid": uid as String,
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
    var query = reference.orderBy('pseudo', descending: false);

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
    var query = reference.orderBy('uid', descending: false);

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

MemberTournament _$MemberTournamentFromJson(Map<String, dynamic> json) =>
    MemberTournament(
      gamerTag: json['gamerTag'] as String,
      role: $enumDecode(_$RoleTypeEnumMap, json['role']),
      member: Member.fromJson(json['member'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MemberTournamentToJson(MemberTournament instance) =>
    <String, dynamic>{
      'gamerTag': instance.gamerTag,
      'role': _$RoleTypeEnumMap[instance.role],
      'member': instance.member.toJson(),
    };

const _$RoleTypeEnumMap = {
  RoleType.leader: 'leader',
  RoleType.player: 'player',
};
