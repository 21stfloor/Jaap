import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallSessionRecord extends FirestoreRecord {
  CallSessionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "agency" field.
  DocumentReference? _agency;
  DocumentReference? get agency => _agency;
  bool hasAgency() => _agency != null;

  // "applicant" field.
  DocumentReference? _applicant;
  DocumentReference? get applicant => _applicant;
  bool hasApplicant() => _applicant != null;

  // "dateStarted" field.
  DateTime? _dateStarted;
  DateTime? get dateStarted => _dateStarted;
  bool hasDateStarted() => _dateStarted != null;

  void _initializeFields() {
    _agency = snapshotData['agency'] as DocumentReference?;
    _applicant = snapshotData['applicant'] as DocumentReference?;
    _dateStarted = snapshotData['dateStarted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CallSession');

  static Stream<CallSessionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CallSessionRecord.fromSnapshot(s));

  static Future<CallSessionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CallSessionRecord.fromSnapshot(s));

  static CallSessionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CallSessionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CallSessionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CallSessionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CallSessionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CallSessionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCallSessionRecordData({
  DocumentReference? agency,
  DocumentReference? applicant,
  DateTime? dateStarted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'agency': agency,
      'applicant': applicant,
      'dateStarted': dateStarted,
    }.withoutNulls,
  );

  return firestoreData;
}

class CallSessionRecordDocumentEquality implements Equality<CallSessionRecord> {
  const CallSessionRecordDocumentEquality();

  @override
  bool equals(CallSessionRecord? e1, CallSessionRecord? e2) {
    return e1?.agency == e2?.agency &&
        e1?.applicant == e2?.applicant &&
        e1?.dateStarted == e2?.dateStarted;
  }

  @override
  int hash(CallSessionRecord? e) =>
      const ListEquality().hash([e?.agency, e?.applicant, e?.dateStarted]);

  @override
  bool isValidKey(Object? o) => o is CallSessionRecord;
}
