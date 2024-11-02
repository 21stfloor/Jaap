import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class JobRecord extends FirestoreRecord {
  JobRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
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

  // "salary" field.
  int? _salary;
  int get salary => _salary ?? 0;
  bool hasSalary() => _salary != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "agency" field.
  DocumentReference? _agency;
  DocumentReference? get agency => _agency;
  bool hasAgency() => _agency != null;

  // "skils" field.
  String? _skils;
  String get skils => _skils ?? '';
  bool hasSkils() => _skils != null;

  // "visible" field.
  bool? _visible;
  bool get visible => _visible ?? false;
  bool hasVisible() => _visible != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "datePosted" field.
  DateTime? _datePosted;
  DateTime? get datePosted => _datePosted;
  bool hasDatePosted() => _datePosted != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _salary = castToType<int>(snapshotData['salary']);
    _location = snapshotData['location'] as String?;
    _agency = snapshotData['agency'] as DocumentReference?;
    _skils = snapshotData['skils'] as String?;
    _visible = snapshotData['visible'] as bool?;
    _region = snapshotData['region'] as String?;
    _type = snapshotData['type'] as String?;
    _datePosted = snapshotData['datePosted'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Job');

  static Stream<JobRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => JobRecord.fromSnapshot(s));

  static Future<JobRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => JobRecord.fromSnapshot(s));

  static JobRecord fromSnapshot(DocumentSnapshot snapshot) => JobRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static JobRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      JobRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'JobRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is JobRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createJobRecordData({
  String? title,
  String? description,
  int? salary,
  String? location,
  DocumentReference? agency,
  String? skils,
  bool? visible,
  String? region,
  String? type,
  DateTime? datePosted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'salary': salary,
      'location': location,
      'agency': agency,
      'skils': skils,
      'visible': visible,
      'region': region,
      'type': type,
      'datePosted': datePosted,
    }.withoutNulls,
  );

  return firestoreData;
}

class JobRecordDocumentEquality implements Equality<JobRecord> {
  const JobRecordDocumentEquality();

  @override
  bool equals(JobRecord? e1, JobRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.salary == e2?.salary &&
        e1?.location == e2?.location &&
        e1?.agency == e2?.agency &&
        e1?.skils == e2?.skils &&
        e1?.visible == e2?.visible &&
        e1?.region == e2?.region &&
        e1?.type == e2?.type &&
        e1?.datePosted == e2?.datePosted;
  }

  @override
  int hash(JobRecord? e) => const ListEquality().hash([
        e?.title,
        e?.description,
        e?.salary,
        e?.location,
        e?.agency,
        e?.skils,
        e?.visible,
        e?.region,
        e?.type,
        e?.datePosted
      ]);

  @override
  bool isValidKey(Object? o) => o is JobRecord;
}
