import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppllicantProfileRecord extends FirestoreRecord {
  AppllicantProfileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uploadResume" field.
  String? _uploadResume;
  String get uploadResume => _uploadResume ?? '';
  bool hasUploadResume() => _uploadResume != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "currentCompany" field.
  DocumentReference? _currentCompany;
  DocumentReference? get currentCompany => _currentCompany;
  bool hasCurrentCompany() => _currentCompany != null;

  // "jobTitle" field.
  String? _jobTitle;
  String get jobTitle => _jobTitle ?? '';
  bool hasJobTitle() => _jobTitle != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "birthPlace" field.
  String? _birthPlace;
  String get birthPlace => _birthPlace ?? '';
  bool hasBirthPlace() => _birthPlace != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _uploadResume = snapshotData['uploadResume'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _currentCompany = snapshotData['currentCompany'] as DocumentReference?;
    _jobTitle = snapshotData['jobTitle'] as String?;
    _address = snapshotData['address'] as String?;
    _birthPlace = snapshotData['birthPlace'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('appllicantProfile')
          : FirebaseFirestore.instance.collectionGroup('appllicantProfile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('appllicantProfile').doc(id);

  static Stream<AppllicantProfileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppllicantProfileRecord.fromSnapshot(s));

  static Future<AppllicantProfileRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => AppllicantProfileRecord.fromSnapshot(s));

  static AppllicantProfileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AppllicantProfileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppllicantProfileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppllicantProfileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppllicantProfileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppllicantProfileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppllicantProfileRecordData({
  String? uploadResume,
  DocumentReference? user,
  DocumentReference? currentCompany,
  String? jobTitle,
  String? address,
  String? birthPlace,
  DateTime? birthday,
  String? bio,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uploadResume': uploadResume,
      'user': user,
      'currentCompany': currentCompany,
      'jobTitle': jobTitle,
      'address': address,
      'birthPlace': birthPlace,
      'birthday': birthday,
      'bio': bio,
    }.withoutNulls,
  );

  return firestoreData;
}

class AppllicantProfileRecordDocumentEquality
    implements Equality<AppllicantProfileRecord> {
  const AppllicantProfileRecordDocumentEquality();

  @override
  bool equals(AppllicantProfileRecord? e1, AppllicantProfileRecord? e2) {
    return e1?.uploadResume == e2?.uploadResume &&
        e1?.user == e2?.user &&
        e1?.currentCompany == e2?.currentCompany &&
        e1?.jobTitle == e2?.jobTitle &&
        e1?.address == e2?.address &&
        e1?.birthPlace == e2?.birthPlace &&
        e1?.birthday == e2?.birthday &&
        e1?.bio == e2?.bio;
  }

  @override
  int hash(AppllicantProfileRecord? e) => const ListEquality().hash([
        e?.uploadResume,
        e?.user,
        e?.currentCompany,
        e?.jobTitle,
        e?.address,
        e?.birthPlace,
        e?.birthday,
        e?.bio
      ]);

  @override
  bool isValidKey(Object? o) => o is AppllicantProfileRecord;
}
