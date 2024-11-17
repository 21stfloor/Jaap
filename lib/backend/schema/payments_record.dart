import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentsRecord extends FirestoreRecord {
  PaymentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "currency" field.
  String? _currency;
  String get currency => _currency ?? '';
  bool hasCurrency() => _currency != null;

  // "paymentMethod" field.
  String? _paymentMethod;
  String get paymentMethod => _paymentMethod ?? '';
  bool hasPaymentMethod() => _paymentMethod != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "jobPost" field.
  DocumentReference? _jobPost;
  DocumentReference? get jobPost => _jobPost;
  bool hasJobPost() => _jobPost != null;

  // "expiry" field.
  DateTime? _expiry;
  DateTime? get expiry => _expiry;
  bool hasExpiry() => _expiry != null;

  // "expired" field.
  bool? _expired;
  bool get expired => _expired ?? false;
  bool hasExpired() => _expired != null;

  // "accepted" field.
  bool? _accepted;
  bool get accepted => _accepted ?? false;
  bool hasAccepted() => _accepted != null;

  void _initializeFields() {
    _amount = castToType<double>(snapshotData['amount']);
    _currency = snapshotData['currency'] as String?;
    _paymentMethod = snapshotData['paymentMethod'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _jobPost = snapshotData['jobPost'] as DocumentReference?;
    _expiry = snapshotData['expiry'] as DateTime?;
    _expired = snapshotData['expired'] as bool?;
    _accepted = snapshotData['accepted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payments');

  static Stream<PaymentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentsRecord.fromSnapshot(s));

  static Future<PaymentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentsRecord.fromSnapshot(s));

  static PaymentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentsRecordData({
  double? amount,
  String? currency,
  String? paymentMethod,
  DateTime? date,
  DocumentReference? sender,
  DocumentReference? jobPost,
  DateTime? expiry,
  bool? expired,
  bool? accepted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'amount': amount,
      'currency': currency,
      'paymentMethod': paymentMethod,
      'date': date,
      'sender': sender,
      'jobPost': jobPost,
      'expiry': expiry,
      'expired': expired,
      'accepted': accepted,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentsRecordDocumentEquality implements Equality<PaymentsRecord> {
  const PaymentsRecordDocumentEquality();

  @override
  bool equals(PaymentsRecord? e1, PaymentsRecord? e2) {
    return e1?.amount == e2?.amount &&
        e1?.currency == e2?.currency &&
        e1?.paymentMethod == e2?.paymentMethod &&
        e1?.date == e2?.date &&
        e1?.sender == e2?.sender &&
        e1?.jobPost == e2?.jobPost &&
        e1?.expiry == e2?.expiry &&
        e1?.expired == e2?.expired &&
        e1?.accepted == e2?.accepted;
  }

  @override
  int hash(PaymentsRecord? e) => const ListEquality().hash([
        e?.amount,
        e?.currency,
        e?.paymentMethod,
        e?.date,
        e?.sender,
        e?.jobPost,
        e?.expiry,
        e?.expired,
        e?.accepted
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentsRecord;
}
