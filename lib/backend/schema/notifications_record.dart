import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _message = snapshotData['message'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _seen = snapshotData['seen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? type,
  String? message,
  DateTime? time,
  DocumentReference? user,
  bool? seen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'message': message,
      'time': time,
      'user': user,
      'seen': seen,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.message == e2?.message &&
        e1?.time == e2?.time &&
        e1?.user == e2?.user &&
        e1?.seen == e2?.seen;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality()
      .hash([e?.type, e?.message, e?.time, e?.user, e?.seen]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
