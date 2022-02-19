// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin.dart';

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
abstract class AdminCollectionReference
    implements AdminQuery, FirestoreCollectionReference<AdminQuerySnapshot> {
  factory AdminCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$AdminCollectionReference;

  static Admin fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Admin.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Admin value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  AdminDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<AdminDocumentReference> add(Admin value);
}

class _$AdminCollectionReference extends _$AdminQuery
    implements AdminCollectionReference {
  factory _$AdminCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$AdminCollectionReference._(
      firestore.collection('Admins').withConverter(
            fromFirestore: AdminCollectionReference.fromFirestore,
            toFirestore: AdminCollectionReference.toFirestore,
          ),
    );
  }

  _$AdminCollectionReference._(
    CollectionReference<Admin> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Admin> get reference =>
      super.reference as CollectionReference<Admin>;

  @override
  AdminDocumentReference doc([String? id]) {
    return AdminDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<AdminDocumentReference> add(Admin value) {
    return reference.add(value).then((ref) => AdminDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$AdminCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class AdminDocumentReference
    extends FirestoreDocumentReference<AdminDocumentSnapshot> {
  factory AdminDocumentReference(DocumentReference<Admin> reference) =
      _$AdminDocumentReference;

  DocumentReference<Admin> get reference;

  /// A reference to the [AdminCollectionReference] containing this document.
  AdminCollectionReference get parent {
    return _$AdminCollectionReference(reference.firestore);
  }

  @override
  Stream<AdminDocumentSnapshot> snapshots();

  @override
  Future<AdminDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String? uid,
  });

  Future<void> set(Admin value);
}

class _$AdminDocumentReference
    extends FirestoreDocumentReference<AdminDocumentSnapshot>
    implements AdminDocumentReference {
  _$AdminDocumentReference(this.reference);

  @override
  final DocumentReference<Admin> reference;

  /// A reference to the [AdminCollectionReference] containing this document.
  AdminCollectionReference get parent {
    return _$AdminCollectionReference(reference.firestore);
  }

  @override
  Stream<AdminDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return AdminDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<AdminDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return AdminDocumentSnapshot._(
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
    Object? uid = _sentinel,
  }) async {
    final json = {
      if (uid != _sentinel) "uid": uid as String?,
    };

    return reference.update(json);
  }

  Future<void> set(Admin value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is AdminDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class AdminDocumentSnapshot extends FirestoreDocumentSnapshot {
  AdminDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Admin> snapshot;

  @override
  AdminDocumentReference get reference {
    return AdminDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Admin? data;
}

abstract class AdminQuery implements QueryReference<AdminQuerySnapshot> {
  @override
  AdminQuery limit(int limit);

  @override
  AdminQuery limitToLast(int limit);

  AdminQuery whereUid({
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

  AdminQuery orderByUid({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    AdminDocumentSnapshot? startAtDocument,
    AdminDocumentSnapshot? endAtDocument,
    AdminDocumentSnapshot? endBeforeDocument,
    AdminDocumentSnapshot? startAfterDocument,
  });
}

class _$AdminQuery extends QueryReference<AdminQuerySnapshot>
    implements AdminQuery {
  _$AdminQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Admin> reference;

  AdminQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Admin> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return AdminQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<AdminDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: AdminDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return AdminQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<AdminQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<AdminQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  AdminQuery limit(int limit) {
    return _$AdminQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  AdminQuery limitToLast(int limit) {
    return _$AdminQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  AdminQuery whereUid({
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
    return _$AdminQuery(
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

  AdminQuery orderByUid({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    AdminDocumentSnapshot? startAtDocument,
    AdminDocumentSnapshot? endAtDocument,
    AdminDocumentSnapshot? endBeforeDocument,
    AdminDocumentSnapshot? startAfterDocument,
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

    return _$AdminQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$AdminQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class AdminQuerySnapshot
    extends FirestoreQuerySnapshot<AdminQueryDocumentSnapshot> {
  AdminQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Admin> snapshot;

  @override
  final List<AdminQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<AdminDocumentSnapshot>> docChanges;
}

class AdminQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements AdminDocumentSnapshot {
  AdminQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Admin> snapshot;

  @override
  AdminDocumentReference get reference {
    return AdminDocumentReference(snapshot.reference);
  }

  @override
  final Admin data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Admin _$AdminFromJson(Map<String, dynamic> json) => Admin(
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$AdminToJson(Admin instance) => <String, dynamic>{
      'uid': instance.uid,
    };
