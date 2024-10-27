import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlansRecord extends FirestoreRecord {
  PlansRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "monthlyPrice" field.
  double? _monthlyPrice;
  double get monthlyPrice => _monthlyPrice ?? 0.0;
  bool hasMonthlyPrice() => _monthlyPrice != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "canBePaidYearly" field.
  bool? _canBePaidYearly;
  bool get canBePaidYearly => _canBePaidYearly ?? false;
  bool hasCanBePaidYearly() => _canBePaidYearly != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _monthlyPrice = castToType<double>(snapshotData['monthlyPrice']);
    _description = snapshotData['description'] as String?;
    _canBePaidYearly = snapshotData['canBePaidYearly'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('plans');

  static Stream<PlansRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlansRecord.fromSnapshot(s));

  static Future<PlansRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlansRecord.fromSnapshot(s));

  static PlansRecord fromSnapshot(DocumentSnapshot snapshot) => PlansRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlansRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlansRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlansRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlansRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlansRecordData({
  String? title,
  double? monthlyPrice,
  String? description,
  bool? canBePaidYearly,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'monthlyPrice': monthlyPrice,
      'description': description,
      'canBePaidYearly': canBePaidYearly,
    }.withoutNulls,
  );

  return firestoreData;
}

class PlansRecordDocumentEquality implements Equality<PlansRecord> {
  const PlansRecordDocumentEquality();

  @override
  bool equals(PlansRecord? e1, PlansRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.monthlyPrice == e2?.monthlyPrice &&
        e1?.description == e2?.description &&
        e1?.canBePaidYearly == e2?.canBePaidYearly;
  }

  @override
  int hash(PlansRecord? e) => const ListEquality()
      .hash([e?.title, e?.monthlyPrice, e?.description, e?.canBePaidYearly]);

  @override
  bool isValidKey(Object? o) => o is PlansRecord;
}
