import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReferalRecord extends FirestoreRecord {
  ReferalRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _code = snapshotData['code'] as String?;
    _owner = snapshotData['owner'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('referal');

  static Stream<ReferalRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReferalRecord.fromSnapshot(s));

  static Future<ReferalRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReferalRecord.fromSnapshot(s));

  static ReferalRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReferalRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReferalRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReferalRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReferalRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReferalRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReferalRecordData({
  DocumentReference? userRef,
  String? code,
  DocumentReference? owner,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'code': code,
      'owner': owner,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReferalRecordDocumentEquality implements Equality<ReferalRecord> {
  const ReferalRecordDocumentEquality();

  @override
  bool equals(ReferalRecord? e1, ReferalRecord? e2) {
    return e1?.userRef == e2?.userRef &&
        e1?.code == e2?.code &&
        e1?.owner == e2?.owner &&
        e1?.status == e2?.status;
  }

  @override
  int hash(ReferalRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.code, e?.owner, e?.status]);

  @override
  bool isValidKey(Object? o) => o is ReferalRecord;
}
