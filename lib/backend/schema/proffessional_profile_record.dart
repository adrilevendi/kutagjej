import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProffessionalProfileRecord extends FirestoreRecord {
  ProffessionalProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "pricePerHour" field.
  double? _pricePerHour;
  double get pricePerHour => _pricePerHour ?? 0.0;
  bool hasPricePerHour() => _pricePerHour != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photoUrl" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  void _initializeFields() {
    _categories = getDataList(snapshotData['categories']);
    _userName = snapshotData['userName'] as String?;
    _pricePerHour = castToType<double>(snapshotData['pricePerHour']);
    _description = snapshotData['description'] as String?;
    _photoUrl = snapshotData['photoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('proffessional_profile');

  static Stream<ProffessionalProfileRecord> getDocument(
          DocumentReference ref) =>
      ref.snapshots().map((s) => ProffessionalProfileRecord.fromSnapshot(s));

  static Future<ProffessionalProfileRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ProffessionalProfileRecord.fromSnapshot(s));

  static ProffessionalProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProffessionalProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProffessionalProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProffessionalProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProffessionalProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProffessionalProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProffessionalProfileRecordData({
  String? userName,
  double? pricePerHour,
  String? description,
  String? photoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'pricePerHour': pricePerHour,
      'description': description,
      'photoUrl': photoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProffessionalProfileRecordDocumentEquality
    implements Equality<ProffessionalProfileRecord> {
  const ProffessionalProfileRecordDocumentEquality();

  @override
  bool equals(ProffessionalProfileRecord? e1, ProffessionalProfileRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.userName == e2?.userName &&
        e1?.pricePerHour == e2?.pricePerHour &&
        e1?.description == e2?.description &&
        e1?.photoUrl == e2?.photoUrl;
  }

  @override
  int hash(ProffessionalProfileRecord? e) => const ListEquality().hash([
        e?.categories,
        e?.userName,
        e?.pricePerHour,
        e?.description,
        e?.photoUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is ProffessionalProfileRecord;
}
