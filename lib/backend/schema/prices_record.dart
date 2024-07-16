import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricesRecord extends FirestoreRecord {
  PricesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _price = castToType<double>(snapshotData['price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('prices');

  static Stream<PricesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricesRecord.fromSnapshot(s));

  static Future<PricesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricesRecord.fromSnapshot(s));

  static PricesRecord fromSnapshot(DocumentSnapshot snapshot) => PricesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricesRecordData({
  String? type,
  double? price,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'price': price,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricesRecordDocumentEquality implements Equality<PricesRecord> {
  const PricesRecordDocumentEquality();

  @override
  bool equals(PricesRecord? e1, PricesRecord? e2) {
    return e1?.type == e2?.type && e1?.price == e2?.price;
  }

  @override
  int hash(PricesRecord? e) => const ListEquality().hash([e?.type, e?.price]);

  @override
  bool isValidKey(Object? o) => o is PricesRecord;
}
