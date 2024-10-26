import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UnitRecord extends FirestoreRecord {
  UnitRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "label" field.
  String? _label;
  String get label => _label ?? '';
  bool hasLabel() => _label != null;

  void _initializeFields() {
    _slug = snapshotData['slug'] as String?;
    _label = snapshotData['label'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('unit');

  static Stream<UnitRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UnitRecord.fromSnapshot(s));

  static Future<UnitRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UnitRecord.fromSnapshot(s));

  static UnitRecord fromSnapshot(DocumentSnapshot snapshot) => UnitRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UnitRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UnitRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UnitRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UnitRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUnitRecordData({
  String? slug,
  String? label,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'slug': slug,
      'label': label,
    }.withoutNulls,
  );

  return firestoreData;
}

class UnitRecordDocumentEquality implements Equality<UnitRecord> {
  const UnitRecordDocumentEquality();

  @override
  bool equals(UnitRecord? e1, UnitRecord? e2) {
    return e1?.slug == e2?.slug && e1?.label == e2?.label;
  }

  @override
  int hash(UnitRecord? e) => const ListEquality().hash([e?.slug, e?.label]);

  @override
  bool isValidKey(Object? o) => o is UnitRecord;
}
