import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewRecord extends FirestoreRecord {
  ReviewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "reviewedRef" field.
  DocumentReference? _reviewedRef;
  DocumentReference? get reviewedRef => _reviewedRef;
  bool hasReviewedRef() => _reviewedRef != null;

  // "reviewerRef" field.
  DocumentReference? _reviewerRef;
  DocumentReference? get reviewerRef => _reviewerRef;
  bool hasReviewerRef() => _reviewerRef != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _reviewedRef = snapshotData['reviewedRef'] as DocumentReference?;
    _reviewerRef = snapshotData['reviewerRef'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _rating = castToType<double>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review');

  static Stream<ReviewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewRecord.fromSnapshot(s));

  static Future<ReviewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewRecord.fromSnapshot(s));

  static ReviewRecord fromSnapshot(DocumentSnapshot snapshot) => ReviewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewRecordData({
  DocumentReference? reviewedRef,
  DocumentReference? reviewerRef,
  DateTime? createdTime,
  String? comment,
  double? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'reviewedRef': reviewedRef,
      'reviewerRef': reviewerRef,
      'createdTime': createdTime,
      'comment': comment,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewRecordDocumentEquality implements Equality<ReviewRecord> {
  const ReviewRecordDocumentEquality();

  @override
  bool equals(ReviewRecord? e1, ReviewRecord? e2) {
    return e1?.reviewedRef == e2?.reviewedRef &&
        e1?.reviewerRef == e2?.reviewerRef &&
        e1?.comment == e2?.comment &&
        e1?.createdTime == e2?.createdTime &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(ReviewRecord? e) => const ListEquality().hash(
      [e?.reviewedRef, e?.reviewerRef, e?.comment, e?.rating, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is ReviewRecord;
}
