import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _rating = castToType<int>(snapshotData['rating']);
    _author = snapshotData['author'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ratings')
          : FirebaseFirestore.instance.collectionGroup('ratings');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ratings').doc(id);

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  int? rating,
  DocumentReference? author,
  String? comment,
  DateTime? date,
  DocumentReference? user,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rating': rating,
      'author': author,
      'comment': comment,
      'date': date,
      'user': user,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.rating == e2?.rating &&
        e1?.author == e2?.author &&
        e1?.comment == e2?.comment &&
        e1?.date == e2?.date &&
        e1?.user == e2?.user;
  }

  @override
  int hash(RatingsRecord? e) => const ListEquality()
      .hash([e?.rating, e?.author, e?.comment, e?.date, e?.user]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
