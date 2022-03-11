// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_classement_member.dart';

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
abstract class RoundClassementMemberCollectionReference
    implements
        RoundClassementMemberQuery,
        FirestoreCollectionReference<RoundClassementMemberQuerySnapshot> {
  factory RoundClassementMemberCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RoundClassementMemberCollectionReference;

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
      [FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RoundClassementMemberCollectionReference._(
      firestore.collection('RoundClassementMember').withConverter(
            fromFirestore:
                RoundClassementMemberCollectionReference.fromFirestore,
            toFirestore: RoundClassementMemberCollectionReference.toFirestore,
          ),
    );
  }

  _$RoundClassementMemberCollectionReference._(
    CollectionReference<RoundClassementMember> reference,
  ) : super(reference, reference);

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
    return _$RoundClassementMemberCollectionReference(reference.firestore);
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
    return _$RoundClassementMemberCollectionReference(reference.firestore);
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

RoundClassementMember _$RoundClassementMemberFromJson(
        Map<String, dynamic> json) =>
    RoundClassementMember(
      round: Round.fromJson(json['round'] as Map<String, dynamic>),
      memberTournament: MemberTournament.fromJson(
          json['memberTournament'] as Map<String, dynamic>),
      kill: json['kill'] as int,
      rang: json['rang'] as int,
    )..screenshot = json['screenshot'] as String?;

Map<String, dynamic> _$RoundClassementMemberToJson(
        RoundClassementMember instance) =>
    <String, dynamic>{
      'round': instance.round.toJson(),
      'memberTournament': instance.memberTournament.toJson(),
      'kill': instance.kill,
      'rang': instance.rang,
      'screenshot': instance.screenshot,
    };
