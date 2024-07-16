import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AgencyPofileRecord extends FirestoreRecord {
  AgencyPofileRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "companyProfile" field.
  String? _companyProfile;
  String get companyProfile => _companyProfile ?? '';
  bool hasCompanyProfile() => _companyProfile != null;

  // "imageBuisnessCertificate" field.
  String? _imageBuisnessCertificate;
  String get imageBuisnessCertificate => _imageBuisnessCertificate ?? '';
  bool hasImageBuisnessCertificate() => _imageBuisnessCertificate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "uploadedDocuments" field.
  List<String>? _uploadedDocuments;
  List<String> get uploadedDocuments => _uploadedDocuments ?? const [];
  bool hasUploadedDocuments() => _uploadedDocuments != null;

  // "aboutUs" field.
  String? _aboutUs;
  String get aboutUs => _aboutUs ?? '';
  bool hasAboutUs() => _aboutUs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _companyProfile = snapshotData['companyProfile'] as String?;
    _imageBuisnessCertificate =
        snapshotData['imageBuisnessCertificate'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _uploadedDocuments = getDataList(snapshotData['uploadedDocuments']);
    _aboutUs = snapshotData['aboutUs'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('agencyPofile')
          : FirebaseFirestore.instance.collectionGroup('agencyPofile');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('agencyPofile').doc(id);

  static Stream<AgencyPofileRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AgencyPofileRecord.fromSnapshot(s));

  static Future<AgencyPofileRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AgencyPofileRecord.fromSnapshot(s));

  static AgencyPofileRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AgencyPofileRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AgencyPofileRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AgencyPofileRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AgencyPofileRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AgencyPofileRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAgencyPofileRecordData({
  String? companyProfile,
  String? imageBuisnessCertificate,
  DocumentReference? user,
  String? aboutUs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'companyProfile': companyProfile,
      'imageBuisnessCertificate': imageBuisnessCertificate,
      'user': user,
      'aboutUs': aboutUs,
    }.withoutNulls,
  );

  return firestoreData;
}

class AgencyPofileRecordDocumentEquality
    implements Equality<AgencyPofileRecord> {
  const AgencyPofileRecordDocumentEquality();

  @override
  bool equals(AgencyPofileRecord? e1, AgencyPofileRecord? e2) {
    const listEquality = ListEquality();
    return e1?.companyProfile == e2?.companyProfile &&
        e1?.imageBuisnessCertificate == e2?.imageBuisnessCertificate &&
        e1?.user == e2?.user &&
        listEquality.equals(e1?.uploadedDocuments, e2?.uploadedDocuments) &&
        e1?.aboutUs == e2?.aboutUs;
  }

  @override
  int hash(AgencyPofileRecord? e) => const ListEquality().hash([
        e?.companyProfile,
        e?.imageBuisnessCertificate,
        e?.user,
        e?.uploadedDocuments,
        e?.aboutUs
      ]);

  @override
  bool isValidKey(Object? o) => o is AgencyPofileRecord;
}
