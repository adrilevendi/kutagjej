import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceRecord extends FirestoreRecord {
  ServiceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "pricePerDay" field.
  double? _pricePerDay;
  double get pricePerDay => _pricePerDay ?? 0.0;
  bool hasPricePerDay() => _pricePerDay != null;

  // "pricePerWeek" field.
  double? _pricePerWeek;
  double get pricePerWeek => _pricePerWeek ?? 0.0;
  bool hasPricePerWeek() => _pricePerWeek != null;

  // "pricePerWeekAdditionalDay" field.
  double? _pricePerWeekAdditionalDay;
  double get pricePerWeekAdditionalDay => _pricePerWeekAdditionalDay ?? 0.0;
  bool hasPricePerWeekAdditionalDay() => _pricePerWeekAdditionalDay != null;

  // "slug" field.
  String? _slug;
  String get slug => _slug ?? '';
  bool hasSlug() => _slug != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "isRecurring" field.
  bool? _isRecurring;
  bool get isRecurring => _isRecurring ?? false;
  bool hasIsRecurring() => _isRecurring != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _pricePerDay = castToType<double>(snapshotData['pricePerDay']);
    _pricePerWeek = castToType<double>(snapshotData['pricePerWeek']);
    _pricePerWeekAdditionalDay =
        castToType<double>(snapshotData['pricePerWeekAdditionalDay']);
    _slug = snapshotData['slug'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _isRecurring = snapshotData['isRecurring'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('service');

  static Stream<ServiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceRecord.fromSnapshot(s));

  static Future<ServiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServiceRecord.fromSnapshot(s));

  static ServiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceRecordData({
  String? title,
  String? description,
  double? pricePerDay,
  double? pricePerWeek,
  double? pricePerWeekAdditionalDay,
  String? slug,
  double? price,
  bool? isRecurring,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'pricePerDay': pricePerDay,
      'pricePerWeek': pricePerWeek,
      'pricePerWeekAdditionalDay': pricePerWeekAdditionalDay,
      'slug': slug,
      'price': price,
      'isRecurring': isRecurring,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceRecordDocumentEquality implements Equality<ServiceRecord> {
  const ServiceRecordDocumentEquality();

  @override
  bool equals(ServiceRecord? e1, ServiceRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.pricePerDay == e2?.pricePerDay &&
        e1?.pricePerWeek == e2?.pricePerWeek &&
        e1?.pricePerWeekAdditionalDay == e2?.pricePerWeekAdditionalDay &&
        e1?.slug == e2?.slug &&
        e1?.price == e2?.price &&
        e1?.isRecurring == e2?.isRecurring;
  }

  @override
  int hash(ServiceRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.pricePerDay,
        e?.pricePerWeek,
        e?.pricePerWeekAdditionalDay,
        e?.slug,
        e?.price,
        e?.isRecurring
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceRecord;
}
