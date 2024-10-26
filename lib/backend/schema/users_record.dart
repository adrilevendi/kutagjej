import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "shortDescription" field.
  String? _shortDescription;
  String get shortDescription => _shortDescription ?? '';
  bool hasShortDescription() => _shortDescription != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "location" field.
  DocumentReference? _location;
  DocumentReference? get location => _location;
  bool hasLocation() => _location != null;

  // "proffessional_profile" field.
  DocumentReference? _proffessionalProfile;
  DocumentReference? get proffessionalProfile => _proffessionalProfile;
  bool hasProffessionalProfile() => _proffessionalProfile != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "verified" field.
  bool? _firstPost;
  bool get firstPost => _firstPost ?? false;
  bool hasfirstPost() => _firstPost != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "category" field.
  String? _category;
  String? get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "favorites" field.
  List<DocumentReference>? _favorites;
  List<DocumentReference> get favorites => _favorites ?? const [];
  bool hasFavorites() => _favorites != null;

  // "referalCode" field.
  String? _referalCode;
  String get referalCode => _referalCode ?? '';
  bool hasReferalCode() => _referalCode != null;

  // "subscription" field.
  DocumentReference? _subscription;
  DocumentReference? get subscription => _subscription;
  bool hasSubscription() => _subscription != null;

  // "eligibleDiscounts" field.
  List<double>? _eligibleDiscounts;
  List<double> get eligibleDiscounts => _eligibleDiscounts ?? const [];
  bool hasEligibleDiscounts() => _eligibleDiscounts != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _shortDescription = snapshotData['shortDescription'] as String?;
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _role = snapshotData['role'] as String?;
    _title = snapshotData['title'] as String?;
    _location = snapshotData['location'] as DocumentReference?;
    _proffessionalProfile =
        snapshotData['proffessional_profile'] as DocumentReference?;
    _verified = snapshotData['verified'] as bool?;
    _firstPost = snapshotData['firstPost'] as bool?;
    _rating = castToType<int>(snapshotData['rating']);
    _category = snapshotData['category'] as String?;
    _favorites = getDataList(snapshotData['favorites']);
    _referalCode = snapshotData['referalCode'] as String?;
    _subscription = snapshotData['subscription'] as DocumentReference?;
    _eligibleDiscounts = getDataList(snapshotData['eligibleDiscounts']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'shortDescription': snapshot.data['shortDescription'],
          'last_active_time': convertAlgoliaParam(
            snapshot.data['last_active_time'],
            ParamType.DateTime,
            false,
          ),
          'role': snapshot.data['role'],
          'title': snapshot.data['title'],
          'location': convertAlgoliaParam(
            snapshot.data['location'],
            ParamType.DocumentReference,
            false,
          ),
          'proffessional_profile': convertAlgoliaParam(
            snapshot.data['proffessional_profile'],
            ParamType.DocumentReference,
            false,
          ),
          'verified': snapshot.data['verified'],
          'firstPost': snapshot.data['firstPost'],
          'rating': convertAlgoliaParam(
            snapshot.data['rating'],
            ParamType.int,
            false,
          ),
          'category': convertAlgoliaParam(
            snapshot.data['category'],
            ParamType.String,
            false,
          ),
          'favorites': safeGet(
            () => convertAlgoliaParam<DocumentReference>(
              snapshot.data['favorites'],
              ParamType.DocumentReference,
              true,
            ).toList(),
          ),
          'referalCode': snapshot.data['referalCode'],
          'subscription': convertAlgoliaParam(
            snapshot.data['subscription'],
            ParamType.DocumentReference,
            false,
          ),
          'eligibleDiscounts': safeGet(
            () => convertAlgoliaParam<double>(
              snapshot.data['eligibleDiscounts'],
              ParamType.double,
              true,
            ).toList(),
          ),
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? shortDescription,
  DateTime? lastActiveTime,
  String? role,
  String? title,
  DocumentReference? location,
  DocumentReference? proffessionalProfile,
  bool? verified,
  bool? firstPost,
  int? rating,
  String? category,
  String? referalCode,
  DocumentReference? subscription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'shortDescription': shortDescription,
      'last_active_time': lastActiveTime,
      'role': role,
      'title': title,
      'location': location,
      'proffessional_profile': proffessionalProfile,
      'verified': verified,
      'firstPost': firstPost,
      'rating': rating,
      'category': category,
      'referalCode': referalCode,
      'subscription': subscription,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.shortDescription == e2?.shortDescription &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.role == e2?.role &&
        e1?.title == e2?.title &&
        e1?.location == e2?.location &&
        e1?.proffessionalProfile == e2?.proffessionalProfile &&
        e1?.verified == e2?.verified &&
        e1?.firstPost == e2?.firstPost &&
        e1?.rating == e2?.rating &&
        e1?.category == e2?.category &&
        listEquality.equals(e1?.favorites, e2?.favorites) &&
        e1?.referalCode == e2?.referalCode &&
        e1?.subscription == e2?.subscription &&
        listEquality.equals(e1?.eligibleDiscounts, e2?.eligibleDiscounts);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.shortDescription,
        e?.lastActiveTime,
        e?.role,
        e?.title,
        e?.location,
        e?.proffessionalProfile,
        e?.firstPost,
        e?.verified,
        e?.rating,
        e?.category,
        e?.favorites,
        e?.referalCode,
        e?.subscription,
        e?.eligibleDiscounts
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
