import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HiredApplicationsRecord extends FirestoreRecord {
  HiredApplicationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "applicant" field.
  DocumentReference? _applicant;
  DocumentReference? get applicant => _applicant;
  bool hasApplicant() => _applicant != null;

  // "dateHired" field.
  DateTime? _dateHired;
  DateTime? get dateHired => _dateHired;
  bool hasDateHired() => _dateHired != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "salary" field.
  double? _salary;
  double get salary => _salary ?? 0.0;
  bool hasSalary() => _salary != null;

  // "agency" field.
  DocumentReference? _agency;
  DocumentReference? get agency => _agency;
  bool hasAgency() => _agency != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _applicant = snapshotData['applicant'] as DocumentReference?;
    _dateHired = snapshotData['dateHired'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _salary = castToType<double>(snapshotData['salary']);
    _agency = snapshotData['agency'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _endDate = snapshotData['endDate'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('hiredApplications')
          : FirebaseFirestore.instance.collectionGroup('hiredApplications');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('hiredApplications').doc(id);

  static Stream<HiredApplicationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HiredApplicationsRecord.fromSnapshot(s));

  static Future<HiredApplicationsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => HiredApplicationsRecord.fromSnapshot(s));

  static HiredApplicationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HiredApplicationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HiredApplicationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HiredApplicationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HiredApplicationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HiredApplicationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHiredApplicationsRecordData({
  DocumentReference? applicant,
  DateTime? dateHired,
  String? title,
  double? salary,
  DocumentReference? agency,
  String? status,
  DateTime? endDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'applicant': applicant,
      'dateHired': dateHired,
      'title': title,
      'salary': salary,
      'agency': agency,
      'status': status,
      'endDate': endDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class HiredApplicationsRecordDocumentEquality
    implements Equality<HiredApplicationsRecord> {
  const HiredApplicationsRecordDocumentEquality();

  @override
  bool equals(HiredApplicationsRecord? e1, HiredApplicationsRecord? e2) {
    return e1?.applicant == e2?.applicant &&
        e1?.dateHired == e2?.dateHired &&
        e1?.title == e2?.title &&
        e1?.salary == e2?.salary &&
        e1?.agency == e2?.agency &&
        e1?.status == e2?.status &&
        e1?.endDate == e2?.endDate;
  }

  @override
  int hash(HiredApplicationsRecord? e) => const ListEquality().hash([
        e?.applicant,
        e?.dateHired,
        e?.title,
        e?.salary,
        e?.agency,
        e?.status,
        e?.endDate
      ]);

  @override
  bool isValidKey(Object? o) => o is HiredApplicationsRecord;
}
