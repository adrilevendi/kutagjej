import 'dart:async';
import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:ku_ta_gjej/backend/backend.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostRecord extends FirestoreRecord {
  PostRecord._(
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

  // "pay" field.
  double? _pay;
  double get pay => _pay ?? 0.0;
  bool hasPay() => _pay != null;

  // "employerName" field.
  String? _employerName;
  String get employerName => _employerName ?? '';
  bool hasEmployerName() => _employerName != null;

  // "location" field.
  DocumentReference? _location;
  DocumentReference? get location => _location;
  bool hasLocation() => _location != null;

  // "openPositions" field.
  int? _openPositions;
  int get openPositions => _openPositions ?? 0;
  bool hasOpenPositions() => _openPositions != null;

  // "publishedDate" field.
  DateTime? _publishedDate;
  DateTime? get publishedDate => _publishedDate;
  bool hasPublishedDate() => _publishedDate != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "companyLogo" field.
  String? _companyLogo;
  String get companyLogo => _companyLogo ?? '';
  bool hasCompanyLogo() => _companyLogo != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  bool hasFeatured() => _featured != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "minPay" field.
  double? _minPay;
  double get minPay => _minPay ?? 0.0;
  bool hasMinPay() => _minPay != null;

  // "maxPay" field.
  double? _maxPay;
  double get maxPay => _maxPay ?? 0.0;
  bool hasMaxPay() => _maxPay != null;

  // "paid" field.
  bool? _paid;
  bool get paid => _paid ?? false;
  bool hasPaid() => _paid != null;

  // "shiftHours" field.
  int? _shiftHours;
  int get shiftHours => _shiftHours ?? 0;
  bool hasShiftHours() => _shiftHours != null;

  // "shift" field.
  int? _shift;
  int get shift => _shift ?? 0;
  bool hasShift() => _shift != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "startTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "position" field.
  String? _position;
  String? get position => _position;
  bool hasPosition() => _position != null;

  // add UserModel or User Collection to PostRecord to do Search Baased on email
  UsersRecord? _userRecord;
  UsersRecord? get userRecord => _userRecord;
  bool hasUserModel() => _userRecord != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _pay = castToType<double>(snapshotData['pay']);
    _employerName = snapshotData['employerName'] as String?;
    _location = snapshotData['location'] as DocumentReference?;
    _openPositions = castToType<int>(snapshotData['openPositions']);
    _publishedDate = snapshotData['publishedDate'] as DateTime?;
    _tags = getDataList(snapshotData['tags']);
    _companyLogo = snapshotData['companyLogo'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _company = snapshotData['company'] as String?;
    _featured = snapshotData['featured'] as bool?;
    _image = snapshotData['image'] as String?;
    _minPay = castToType<double>(snapshotData['minPay']);
    _maxPay = castToType<double>(snapshotData['maxPay']);
    _paid = snapshotData['paid'] as bool?;
    _shiftHours = castToType<int>(snapshotData['shiftHours']);
    _shift = castToType<int>(snapshotData['shift']);
    _startTime = snapshotData['startTime'] as DateTime?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _position = snapshotData['position'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('post');

  static Stream<PostRecord> getDocument(DocumentReference ref) {
    return ref.snapshots().map((s) {
      return PostRecord.fromSnapshot(s);
    });
  }

  static Future<PostRecord> getDocumentOnce(DocumentReference ref) {
    return ref.get().then((s) async {
      // get user model as well and make it a part of the PostRecord

      var postRecord = PostRecord.fromSnapshot(s);

      await postRecord.loadUserModelFromFirebase();
      return postRecord;
    });
  }

  static PostRecord fromSnapshot(DocumentSnapshot snapshot) => PostRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  // load User Model from backend firebase
  Future<void> loadUserModelFromFirebase() async {
    try {
      if (userRef != null) {
        final userRecord = await userRef!.get();
        if (userRecord.exists) {
          _userRecord = UsersRecord.fromSnapshot(userRecord);
        }
      }
    } catch (error, stackTrace) {
      log('Error loading UserModel: $error');
      log('Stack Trace: $stackTrace');
    }
  }

  static PostRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostRecord._(reference, mapFromFirestore(data));

  // static String getTimeLeft(
  //   DateTime? endTime,
  // ) {
  //   var d = endTime != null
  //       ? endTime.difference(getCurrentTimestamp)
  //       : const Duration(days: 1);
  //   return "${d.inDays} Day${d.inDays == 1 ? '' : 's'} - ${d.inHours - d.inDays * 24} : ${d.inMinutes - d.inHours * 60} : ${d.inSeconds - d.inMinutes * 60}";
  // }

  // static int getDaysLeft(
  //   DateTime? endTime,
  // ) {
  //   var d = endTime != null
  //       ? endTime.difference(getCurrentTimestamp)
  //       : const Duration(days: 1);
  //   return d.inDays;
  // }

  static String getTimeLeft(DateTime? endTime) {
    var d = endTime != null
        ? endTime.difference(getCurrentTimestamp)
        : const Duration(days: 1);

    // Calculate components
    final days = d.inDays;
    final hours = (d.inHours % 24); // Get remaining hours after days
    final minutes = (d.inMinutes % 60); // Get remaining minutes after hours
    final seconds = (d.inSeconds % 60); // Get remaining seconds after minutes

    return "$days Day${days == 1 ? '' : 's'} - $hours:$minutes:$seconds";
  }

  static int getDaysLeft(DateTime? endTime) {
    var d = endTime != null
        ? endTime.difference(getCurrentTimestamp)
        : const Duration(days: 1);
    return d.inDays;
  }

// Stream that emits updated time string every second
  static Stream<String> getTimeLeftStream(DateTime? endTime) {
    return Stream.periodic(const Duration(seconds: 1), (_) {
      return getTimeLeft(endTime);
    });
  }

  bool isOnLastDay(DateTime? param) =>
      param!.difference(getCurrentTimestamp).inDays < 31;

  @override
  String toString() =>
      'PostRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostRecordData({
  String? title,
  String? description,
  double? pay,
  String? employerName,
  DocumentReference? location,
  int? openPositions,
  DateTime? publishedDate,
  String? companyLogo,
  DocumentReference? userRef,
  String? company,
  bool? featured,
  String? image,
  double? minPay,
  double? maxPay,
  bool? paid,
  int? shiftHours,
  int? shift,
  DateTime? startTime,
  DateTime? endTime,
  String? position,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'pay': pay,
      'employerName': employerName,
      'location': location,
      'openPositions': openPositions,
      'publishedDate': publishedDate,
      'companyLogo': companyLogo,
      'userRef': userRef,
      'company': company,
      'featured': featured,
      'image': image,
      'minPay': minPay,
      'maxPay': maxPay,
      'paid': paid,
      'shiftHours': shiftHours,
      'shift': shift,
      'startTime': startTime,
      'endTime': endTime,
      'position': position,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostRecordDocumentEquality implements Equality<PostRecord> {
  const PostRecordDocumentEquality();

  @override
  bool equals(PostRecord? e1, PostRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.pay == e2?.pay &&
        e1?.employerName == e2?.employerName &&
        e1?.location == e2?.location &&
        e1?.openPositions == e2?.openPositions &&
        e1?.publishedDate == e2?.publishedDate &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.companyLogo == e2?.companyLogo &&
        e1?.userRef == e2?.userRef &&
        e1?.company == e2?.company &&
        e1?.featured == e2?.featured &&
        e1?.image == e2?.image &&
        e1?.minPay == e2?.minPay &&
        e1?.maxPay == e2?.maxPay &&
        e1?.paid == e2?.paid &&
        e1?.shiftHours == e2?.shiftHours &&
        e1?.shift == e2?.shift &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime &&
        e1?.position == e2?.position;
  }

  @override
  int hash(PostRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.pay,
        e?.employerName,
        e?.location,
        e?.openPositions,
        e?.publishedDate,
        e?.tags,
        e?.companyLogo,
        e?.userRef,
        e?.company,
        e?.featured,
        e?.image,
        e?.minPay,
        e?.maxPay,
        e?.paid,
        e?.shiftHours,
        e?.shift,
        e?.startTime,
        e?.endTime,
        e?.position
      ]);

  @override
  bool isValidKey(Object? o) => o is PostRecord;
}
