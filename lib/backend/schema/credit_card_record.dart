import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreditCardRecord extends FirestoreRecord {
  CreditCardRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "number" field.
  int? _number;
  int get number => _number ?? 0;
  bool hasNumber() => _number != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "expDate" field.
  DateTime? _expDate;
  DateTime? get expDate => _expDate;
  bool hasExpDate() => _expDate != null;

  // "cvv" field.
  int? _cvv;
  int get cvv => _cvv ?? 0;
  bool hasCvv() => _cvv != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  void _initializeFields() {
    _number = castToType<int>(snapshotData['number']);
    _name = snapshotData['name'] as String?;
    _expDate = snapshotData['expDate'] as DateTime?;
    _cvv = castToType<int>(snapshotData['cvv']);
    _userRef = snapshotData['userRef'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('creditCard');

  static Stream<CreditCardRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CreditCardRecord.fromSnapshot(s));

  static Future<CreditCardRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CreditCardRecord.fromSnapshot(s));

  static CreditCardRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CreditCardRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CreditCardRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CreditCardRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CreditCardRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CreditCardRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCreditCardRecordData({
  int? number,
  String? name,
  DateTime? expDate,
  int? cvv,
  DocumentReference? userRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'number': number,
      'name': name,
      'expDate': expDate,
      'cvv': cvv,
      'userRef': userRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class CreditCardRecordDocumentEquality implements Equality<CreditCardRecord> {
  const CreditCardRecordDocumentEquality();

  @override
  bool equals(CreditCardRecord? e1, CreditCardRecord? e2) {
    return e1?.number == e2?.number &&
        e1?.name == e2?.name &&
        e1?.expDate == e2?.expDate &&
        e1?.cvv == e2?.cvv &&
        e1?.userRef == e2?.userRef;
  }

  @override
  int hash(CreditCardRecord? e) => const ListEquality()
      .hash([e?.number, e?.name, e?.expDate, e?.cvv, e?.userRef]);

  @override
  bool isValidKey(Object? o) => o is CreditCardRecord;
}
