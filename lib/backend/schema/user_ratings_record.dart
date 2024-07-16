import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRatingsRecord extends FirestoreRecord {
  UserRatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "totalRating" field.
  int? _totalRating;
  int get totalRating => _totalRating ?? 0;
  bool hasTotalRating() => _totalRating != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "averageRating" field.
  int? _averageRating;
  int get averageRating => _averageRating ?? 0;
  bool hasAverageRating() => _averageRating != null;

  // "ratingCount" field.
  int? _ratingCount;
  int get ratingCount => _ratingCount ?? 0;
  bool hasRatingCount() => _ratingCount != null;

  void _initializeFields() {
    _totalRating = castToType<int>(snapshotData['totalRating']);
    _user = snapshotData['user'] as DocumentReference?;
    _averageRating = castToType<int>(snapshotData['averageRating']);
    _ratingCount = castToType<int>(snapshotData['ratingCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userRatings');

  static Stream<UserRatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRatingsRecord.fromSnapshot(s));

  static Future<UserRatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRatingsRecord.fromSnapshot(s));

  static UserRatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserRatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRatingsRecordData({
  int? totalRating,
  DocumentReference? user,
  int? averageRating,
  int? ratingCount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'totalRating': totalRating,
      'user': user,
      'averageRating': averageRating,
      'ratingCount': ratingCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRatingsRecordDocumentEquality implements Equality<UserRatingsRecord> {
  const UserRatingsRecordDocumentEquality();

  @override
  bool equals(UserRatingsRecord? e1, UserRatingsRecord? e2) {
    return e1?.totalRating == e2?.totalRating &&
        e1?.user == e2?.user &&
        e1?.averageRating == e2?.averageRating &&
        e1?.ratingCount == e2?.ratingCount;
  }

  @override
  int hash(UserRatingsRecord? e) => const ListEquality()
      .hash([e?.totalRating, e?.user, e?.averageRating, e?.ratingCount]);

  @override
  bool isValidKey(Object? o) => o is UserRatingsRecord;
}
