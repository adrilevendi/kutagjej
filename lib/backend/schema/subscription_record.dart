import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionRecord extends FirestoreRecord {
  SubscriptionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "subscriberRef" field.
  DocumentReference? _subscriberRef;
  DocumentReference? get subscriberRef => _subscriberRef;
  bool hasSubscriberRef() => _subscriberRef != null;

  // "serviceRef" field.
  DocumentReference? _serviceRef;
  DocumentReference? get serviceRef => _serviceRef;
  bool hasServiceRef() => _serviceRef != null;

  // "serviceRef" field.
  DocumentReference? _planRef;
  DocumentReference? get planRef => _planRef;
  bool hasPlanRef() => _planRef != null;


  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "referredAccounts" field.
  List<DocumentReference>? _referredAccounts;
  List<DocumentReference> get referredAccounts => _referredAccounts ?? const [];
  bool hasReferredAccounts() => _referredAccounts != null;

  // "activeReferrals" field.
  DocumentReference? _activeReferrals;
  DocumentReference? get activeReferrals => _activeReferrals;
  bool hasActiveReferrals() => _activeReferrals != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  void _initializeFields() {
    _subscriberRef = snapshotData['subscriberRef'] as DocumentReference?;
    _serviceRef = snapshotData['serviceRef'] as DocumentReference?;
    _planRef = snapshotData['planeRef'] as DocumentReference?;
    _active = snapshotData['active'] as bool?;
    _referredAccounts = getDataList(snapshotData['referredAccounts']);
    _activeReferrals = snapshotData['activeReferrals'] as DocumentReference?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription');

  static Stream<SubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionRecord.fromSnapshot(s));

  static Future<SubscriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionRecord.fromSnapshot(s));

  static SubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionRecordData({
  DocumentReference? subscriberRef,
  DocumentReference? serviceRef,
  DocumentReference? planRef,
  bool? active,
  DocumentReference? activeReferrals,
  DateTime? startTime,
  DateTime? endTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'subscriberRef': subscriberRef,
      'serviceRef': serviceRef,
      'planRef': planRef,
      'active': active,
      'activeReferrals': activeReferrals,
      'startTime': startTime,
      'endTime': endTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionRecordDocumentEquality
    implements Equality<SubscriptionRecord> {
  const SubscriptionRecordDocumentEquality();

  @override
  bool equals(SubscriptionRecord? e1, SubscriptionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.subscriberRef == e2?.subscriberRef &&
        e1?.serviceRef == e2?.serviceRef &&
        e1?.planRef == e2?.planRef &&
        e1?.active == e2?.active &&
        listEquality.equals(e1?.referredAccounts, e2?.referredAccounts) &&
        e1?.activeReferrals == e2?.activeReferrals &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime;
  }

  @override
  int hash(SubscriptionRecord? e) => const ListEquality().hash([
        e?.subscriberRef,
        e?.serviceRef,
        e?.planRef,
        e?.active,
        e?.referredAccounts,
        e?.activeReferrals,
        e?.startTime,
        e?.endTime
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionRecord;
}
