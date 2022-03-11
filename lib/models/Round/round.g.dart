// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round.dart';

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
abstract class RoundCollectionReference
    implements RoundQuery, FirestoreCollectionReference<RoundQuerySnapshot> {
  factory RoundCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RoundCollectionReference;

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

  @override
  RoundDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RoundDocumentReference> add(Round value);
}

class _$RoundCollectionReference extends _$RoundQuery
    implements RoundCollectionReference {
  factory _$RoundCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RoundCollectionReference._(
      firestore.collection('Rounds').withConverter(
            fromFirestore: RoundCollectionReference.fromFirestore,
            toFirestore: RoundCollectionReference.toFirestore,
          ),
    );
  }

  _$RoundCollectionReference._(
    CollectionReference<Round> reference,
  ) : super(reference, reference);

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
    return _$RoundCollectionReference(reference.firestore);
  }

  late final RoundClassementMemberCollectionReference roundClassementMembers =
      _$RoundClassementMemberCollectionReference(
    reference,
  );

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
    return _$RoundCollectionReference(reference.firestore);
  }

  late final RoundClassementMemberCollectionReference roundClassementMembers =
      _$RoundClassementMemberCollectionReference(
    reference,
  );

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
abstract class RoundClassementMemberCollectionReference
    implements
        RoundClassementMemberQuery,
        FirestoreCollectionReference<RoundClassementMemberQuerySnapshot> {
  factory RoundClassementMemberCollectionReference(
    DocumentReference<Round> parent,
  ) = _$RoundClassementMemberCollectionReference;

  static RoundClassementMember fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return RoundClassementMember.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    RoundClassementMember value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [RoundDocumentReference] if this is a subcollection.
  RoundDocumentReference get parent;

  @override
  RoundClassementMemberDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RoundClassementMemberDocumentReference> add(
      RoundClassementMember value);
}

class _$RoundClassementMemberCollectionReference
    extends _$RoundClassementMemberQuery
    implements RoundClassementMemberCollectionReference {
  factory _$RoundClassementMemberCollectionReference(
    DocumentReference<Round> parent,
  ) {
    return _$RoundClassementMemberCollectionReference._(
      RoundDocumentReference(parent),
      parent.collection('roundClassementMembers').withConverter(
            fromFirestore:
                RoundClassementMemberCollectionReference.fromFirestore,
            toFirestore: RoundClassementMemberCollectionReference.toFirestore,
          ),
    );
  }

  _$RoundClassementMemberCollectionReference._(
    this.parent,
    CollectionReference<RoundClassementMember> reference,
  ) : super(reference, reference);

  @override
  final RoundDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<RoundClassementMember> get reference =>
      super.reference as CollectionReference<RoundClassementMember>;

  @override
  RoundClassementMemberDocumentReference doc([String? id]) {
    return RoundClassementMemberDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RoundClassementMemberDocumentReference> add(
      RoundClassementMember value) {
    return reference
        .add(value)
        .then((ref) => RoundClassementMemberDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoundClassementMemberCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RoundClassementMemberDocumentReference
    extends FirestoreDocumentReference<RoundClassementMemberDocumentSnapshot> {
  factory RoundClassementMemberDocumentReference(
          DocumentReference<RoundClassementMember> reference) =
      _$RoundClassementMemberDocumentReference;

  DocumentReference<RoundClassementMember> get reference;

  /// A reference to the [RoundClassementMemberCollectionReference] containing this document.
  RoundClassementMemberCollectionReference get parent {
    return _$RoundClassementMemberCollectionReference(
      reference.parent.parent!.withConverter<Round>(
        fromFirestore: RoundCollectionReference.fromFirestore,
        toFirestore: RoundCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RoundClassementMemberDocumentSnapshot> snapshots();

  @override
  Future<RoundClassementMemberDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    int kill,
    int rang,
    String? screenshot,
  });

  Future<void> set(RoundClassementMember value);
}

class _$RoundClassementMemberDocumentReference
    extends FirestoreDocumentReference<RoundClassementMemberDocumentSnapshot>
    implements RoundClassementMemberDocumentReference {
  _$RoundClassementMemberDocumentReference(this.reference);

  @override
  final DocumentReference<RoundClassementMember> reference;

  /// A reference to the [RoundClassementMemberCollectionReference] containing this document.
  RoundClassementMemberCollectionReference get parent {
    return _$RoundClassementMemberCollectionReference(
      reference.parent.parent!.withConverter<Round>(
        fromFirestore: RoundCollectionReference.fromFirestore,
        toFirestore: RoundCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RoundClassementMemberDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RoundClassementMemberDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RoundClassementMemberDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RoundClassementMemberDocumentSnapshot._(
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
    Object? kill = _sentinel,
    Object? rang = _sentinel,
    Object? screenshot = _sentinel,
  }) async {
    final json = {
      if (kill != _sentinel) "kill": kill as int,
      if (rang != _sentinel) "rang": rang as int,
      if (screenshot != _sentinel) "screenshot": screenshot as String?,
    };

    return reference.update(json);
  }

  Future<void> set(RoundClassementMember value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RoundClassementMemberDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RoundClassementMemberDocumentSnapshot extends FirestoreDocumentSnapshot {
  RoundClassementMemberDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<RoundClassementMember> snapshot;

  @override
  RoundClassementMemberDocumentReference get reference {
    return RoundClassementMemberDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final RoundClassementMember? data;
}

abstract class RoundClassementMemberQuery
    implements QueryReference<RoundClassementMemberQuerySnapshot> {
  @override
  RoundClassementMemberQuery limit(int limit);

  @override
  RoundClassementMemberQuery limitToLast(int limit);

  RoundClassementMemberQuery whereKill({
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
  RoundClassementMemberQuery whereRang({
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
  RoundClassementMemberQuery whereScreenshot({
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

  RoundClassementMemberQuery orderByKill({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RoundClassementMemberDocumentSnapshot? startAtDocument,
    RoundClassementMemberDocumentSnapshot? endAtDocument,
    RoundClassementMemberDocumentSnapshot? endBeforeDocument,
    RoundClassementMemberDocumentSnapshot? startAfterDocument,
  });

  RoundClassementMemberQuery orderByRang({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    RoundClassementMemberDocumentSnapshot? startAtDocument,
    RoundClassementMemberDocumentSnapshot? endAtDocument,
    RoundClassementMemberDocumentSnapshot? endBeforeDocument,
    RoundClassementMemberDocumentSnapshot? startAfterDocument,
  });

  RoundClassementMemberQuery orderByScreenshot({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RoundClassementMemberDocumentSnapshot? startAtDocument,
    RoundClassementMemberDocumentSnapshot? endAtDocument,
    RoundClassementMemberDocumentSnapshot? endBeforeDocument,
    RoundClassementMemberDocumentSnapshot? startAfterDocument,
  });
}

class _$RoundClassementMemberQuery
    extends QueryReference<RoundClassementMemberQuerySnapshot>
    implements RoundClassementMemberQuery {
  _$RoundClassementMemberQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<RoundClassementMember> reference;

  RoundClassementMemberQuerySnapshot _decodeSnapshot(
    QuerySnapshot<RoundClassementMember> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RoundClassementMemberQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RoundClassementMemberDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RoundClassementMemberDocumentSnapshot._(
            change.doc, change.doc.data()),
      );
    }).toList();

    return RoundClassementMemberQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RoundClassementMemberQuerySnapshot> snapshots(
      [SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RoundClassementMemberQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RoundClassementMemberQuery limit(int limit) {
    return _$RoundClassementMemberQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RoundClassementMemberQuery limitToLast(int limit) {
    return _$RoundClassementMemberQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  RoundClassementMemberQuery whereKill({
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
    return _$RoundClassementMemberQuery(
      reference.where(
        'kill',
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

  RoundClassementMemberQuery whereRang({
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
    return _$RoundClassementMemberQuery(
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

  RoundClassementMemberQuery whereScreenshot({
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
    return _$RoundClassementMemberQuery(
      reference.where(
        'screenshot',
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

  RoundClassementMemberQuery orderByKill({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoundClassementMemberDocumentSnapshot? startAtDocument,
    RoundClassementMemberDocumentSnapshot? endAtDocument,
    RoundClassementMemberDocumentSnapshot? endBeforeDocument,
    RoundClassementMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('kill', descending: descending);

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

    return _$RoundClassementMemberQuery(query, _collection);
  }

  RoundClassementMemberQuery orderByRang({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoundClassementMemberDocumentSnapshot? startAtDocument,
    RoundClassementMemberDocumentSnapshot? endAtDocument,
    RoundClassementMemberDocumentSnapshot? endBeforeDocument,
    RoundClassementMemberDocumentSnapshot? startAfterDocument,
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

    return _$RoundClassementMemberQuery(query, _collection);
  }

  RoundClassementMemberQuery orderByScreenshot({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RoundClassementMemberDocumentSnapshot? startAtDocument,
    RoundClassementMemberDocumentSnapshot? endAtDocument,
    RoundClassementMemberDocumentSnapshot? endBeforeDocument,
    RoundClassementMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('screenshot', descending: descending);

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

    return _$RoundClassementMemberQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$RoundClassementMemberQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RoundClassementMemberQuerySnapshot
    extends FirestoreQuerySnapshot<RoundClassementMemberQueryDocumentSnapshot> {
  RoundClassementMemberQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<RoundClassementMember> snapshot;

  @override
  final List<RoundClassementMemberQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RoundClassementMemberDocumentSnapshot>>
      docChanges;
}

class RoundClassementMemberQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot
    implements RoundClassementMemberDocumentSnapshot {
  RoundClassementMemberQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<RoundClassementMember> snapshot;

  @override
  RoundClassementMemberDocumentReference get reference {
    return RoundClassementMemberDocumentReference(snapshot.reference);
  }

  @override
  final RoundClassementMember data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Round _$RoundFromJson(Map<String, dynamic> json) => Round(
      map: json['map'] == null
          ? null
          : GameMap.fromJson(json['map'] as Map<String, dynamic>),
      roundState:
          $enumDecodeNullable(_$RoundStateEnumMap, json['roundState']) ??
              RoundState.EnAttente,
      roundNumber: json['roundNumber'] as int,
    );

Map<String, dynamic> _$RoundToJson(Round instance) => <String, dynamic>{
      'map': instance.map?.toJson(),
      'roundNumber': instance.roundNumber,
      'roundState': _$RoundStateEnumMap[instance.roundState],
    };

const _$RoundStateEnumMap = {
  RoundState.EnAttente: 'EnAttente',
  RoundState.EnCours: 'EnCours',
  RoundState.Terminer: 'Terminer',
};
