import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "media" field.
  DocumentReference? _media;
  DocumentReference? get media => _media;
  bool hasMedia() => _media != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "read" field.
  bool? _read;
  bool get read => _read ?? false;
  bool hasRead() => _read != null;

  // "delivered" field.
  bool? _delivered;
  bool get delivered => _delivered ?? false;
  bool hasDelivered() => _delivered != null;

  // "sent" field.
  bool? _sent;
  bool get sent => _sent ?? false;
  bool hasSent() => _sent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _media = snapshotData['media'] as DocumentReference?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _read = snapshotData['read'] as bool?;
    _delivered = snapshotData['delivered'] as bool?;
    _sent = snapshotData['sent'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('message')
          : FirebaseFirestore.instance.collectionGroup('message');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('message').doc(id);

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessageRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessageRecordData({
  String? text,
  DateTime? time,
  DocumentReference? media,
  DocumentReference? sender,
  bool? read,
  bool? delivered,
  bool? sent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'time': time,
      'media': media,
      'sender': sender,
      'read': read,
      'delivered': delivered,
      'sent': sent,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessageRecordDocumentEquality implements Equality<MessageRecord> {
  const MessageRecordDocumentEquality();

  @override
  bool equals(MessageRecord? e1, MessageRecord? e2) {
    return e1?.text == e2?.text &&
        e1?.time == e2?.time &&
        e1?.media == e2?.media &&
        e1?.sender == e2?.sender &&
        e1?.read == e2?.read &&
        e1?.delivered == e2?.delivered &&
        e1?.sent == e2?.sent;
  }

  @override
  int hash(MessageRecord? e) => const ListEquality().hash(
      [e?.text, e?.time, e?.media, e?.sender, e?.read, e?.delivered, e?.sent]);

  @override
  bool isValidKey(Object? o) => o is MessageRecord;
}
