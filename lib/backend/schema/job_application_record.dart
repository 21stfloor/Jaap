import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobApplicationRecord extends FirestoreRecord {
  JobApplicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "applicant" field.
  DocumentReference? _applicant;
  DocumentReference? get applicant => _applicant;
  bool hasApplicant() => _applicant != null;

  // "agency" field.
  DocumentReference? _agency;
  DocumentReference? get agency => _agency;
  bool hasAgency() => _agency != null;

  // "chatRef" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _applicant = snapshotData['applicant'] as DocumentReference?;
    _agency = snapshotData['agency'] as DocumentReference?;
    _chatRef = snapshotData['chatRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('jobApplication')
          : FirebaseFirestore.instance.collectionGroup('jobApplication');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('jobApplication').doc(id);

  static Stream<JobApplicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobApplicationRecord.fromSnapshot(s));

  static Future<JobApplicationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobApplicationRecord.fromSnapshot(s));

  static JobApplicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      JobApplicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobApplicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobApplicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobApplicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobApplicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobApplicationRecordData({
  DateTime? date,
  DocumentReference? applicant,
  DocumentReference? agency,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'applicant': applicant,
      'agency': agency,
      'chatRef': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobApplicationRecordDocumentEquality
    implements Equality<JobApplicationRecord> {
  const JobApplicationRecordDocumentEquality();

  @override
  bool equals(JobApplicationRecord? e1, JobApplicationRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.applicant == e2?.applicant &&
        e1?.agency == e2?.agency &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(JobApplicationRecord? e) =>
      const ListEquality().hash([e?.date, e?.applicant, e?.agency, e?.chatRef]);

  @override
  bool isValidKey(Object? o) => o is JobApplicationRecord;
}
