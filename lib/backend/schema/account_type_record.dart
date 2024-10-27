import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AccountTypeRecord extends FirestoreRecord {
  AccountTypeRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "defaultHomePage" field.
  String? _defaultHomePage;
  String get defaultHomePage => _defaultHomePage ?? '';
  bool hasDefaultHomePage() => _defaultHomePage != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _defaultHomePage = snapshotData['defaultHomePage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('accountType');

  static Stream<AccountTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AccountTypeRecord.fromSnapshot(s));

  static Future<AccountTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AccountTypeRecord.fromSnapshot(s));

  static AccountTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AccountTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AccountTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AccountTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AccountTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AccountTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAccountTypeRecordData({
  String? title,
  String? defaultHomePage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'defaultHomePage': defaultHomePage,
    }.withoutNulls,
  );

  return firestoreData;
}

class AccountTypeRecordDocumentEquality implements Equality<AccountTypeRecord> {
  const AccountTypeRecordDocumentEquality();

  @override
  bool equals(AccountTypeRecord? e1, AccountTypeRecord? e2) {
    return e1?.title == e2?.title && e1?.defaultHomePage == e2?.defaultHomePage;
  }

  @override
  int hash(AccountTypeRecord? e) =>
      const ListEquality().hash([e?.title, e?.defaultHomePage]);

  @override
  bool isValidKey(Object? o) => o is AccountTypeRecord;
}
