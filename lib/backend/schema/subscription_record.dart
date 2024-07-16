import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionRecord extends FirestoreRecord {
  SubscriptionRecord._(
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

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "accountNo" field.
  String? _accountNo;
  String get accountNo => _accountNo ?? '';
  bool hasAccountNo() => _accountNo != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _price = castToType<double>(snapshotData['price']);
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _endDate = snapshotData['endDate'] as DateTime?;
    _user = snapshotData['user'] as DocumentReference?;
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _accountNo = snapshotData['accountNo'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscription');

  static Stream<SubscriptionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionRecord.fromSnapshot(s));

  static Future<SubscriptionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionRecord.fromSnapshot(s));

  static SubscriptionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionRecordData({
  String? type,
  double? price,
  DateTime? dateCreated,
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? user,
  String? paymentMethod,
  String? accountNo,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'price': price,
      'dateCreated': dateCreated,
      'startDate': startDate,
      'endDate': endDate,
      'user': user,
      'paymentMethod': paymentMethod,
      'accountNo': accountNo,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionRecordDocumentEquality
    implements Equality<SubscriptionRecord> {
  const SubscriptionRecordDocumentEquality();

  @override
  bool equals(SubscriptionRecord? e1, SubscriptionRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.price == e2?.price &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.user == e2?.user &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.accountNo == e2?.accountNo;
  }

  @override
  int hash(SubscriptionRecord? e) => const ListEquality().hash([
        e?.type,
        e?.price,
        e?.dateCreated,
        e?.startDate,
        e?.endDate,
        e?.user,
        e?.paymentMethod,
        e?.accountNo
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionRecord;
}
