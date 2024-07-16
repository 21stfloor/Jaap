import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

Future startSubscription(
  BuildContext context, {
  required double? price,
  required String? method,
  String? accountNumber,
}) async {
  SubscriptionRecord? result;

  var subscriptionRecordReference = SubscriptionRecord.collection.doc();
  await subscriptionRecordReference.set({
    ...createSubscriptionRecordData(
      type: 'Monthly',
      price: price,
      endDate: functions.addOneMonth(getCurrentTimestamp),
      user: currentUserReference,
      paymentMethod: method,
      accountNo: accountNumber,
    ),
    ...mapToFirestore(
      {
        'dateCreated': FieldValue.serverTimestamp(),
        'startDate': FieldValue.serverTimestamp(),
      },
    ),
  });
  result = SubscriptionRecord.getDocumentFromData({
    ...createSubscriptionRecordData(
      type: 'Monthly',
      price: price,
      endDate: functions.addOneMonth(getCurrentTimestamp),
      user: currentUserReference,
      paymentMethod: method,
      accountNo: accountNumber,
    ),
    ...mapToFirestore(
      {
        'dateCreated': DateTime.now(),
        'startDate': DateTime.now(),
      },
    ),
  }, subscriptionRecordReference);
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('Success'),
        content: Text('Payment was successful! You\'re now subscribed'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}

Future checkSubscription(BuildContext context) async {
  SubscriptionRecord? latestSubscription;

  latestSubscription = await querySubscriptionRecordOnce(
    queryBuilder: (subscriptionRecord) => subscriptionRecord
        .where(
          'user',
          isEqualTo: currentUserReference,
        )
        .orderBy('endDate', descending: true),
    singleRecord: true,
  ).then((s) => s.firstOrNull);
  if (latestSubscription != null) {
    if (latestSubscription!.endDate! >= getCurrentTimestamp) {
      FFAppState().hasSubscription = true;
      FFAppState().update(() {});
    } else {
      FFAppState().hasSubscription = false;
      FFAppState().update(() {});
    }
  } else {
    FFAppState().hasSubscription = false;
    FFAppState().update(() {});
  }
}

Future startBoosting(
  BuildContext context, {
  required double? price,
  required String? method,
  String? accountNumber,
  required DocumentReference? jobPost,
}) async {
  PaymentsRecord? result;

  var paymentsRecordReference = PaymentsRecord.collection.doc();
  await paymentsRecordReference.set({
    ...createPaymentsRecordData(
      amount: price,
      paymentMethod: method,
      sender: currentUserReference,
      jobPost: jobPost,
      expiry: functions.addOneMonth(getCurrentTimestamp),
    ),
    ...mapToFirestore(
      {
        'date': FieldValue.serverTimestamp(),
      },
    ),
  });
  result = PaymentsRecord.getDocumentFromData({
    ...createPaymentsRecordData(
      amount: price,
      paymentMethod: method,
      sender: currentUserReference,
      jobPost: jobPost,
      expiry: functions.addOneMonth(getCurrentTimestamp),
    ),
    ...mapToFirestore(
      {
        'date': DateTime.now(),
      },
    ),
  }, paymentsRecordReference);
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return AlertDialog(
        title: Text('Success'),
        content: Text('Payment was successful! Post is now boosted'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(alertDialogContext),
            child: Text('Ok'),
          ),
        ],
      );
    },
  );
}

Future createNotification(
  BuildContext context, {
  required DocumentReference? user,
  required String? message,
}) async {
  await NotificationsRecord.collection.doc().set({
    ...createNotificationsRecordData(
      message: message,
      user: user,
      seen: false,
    ),
    ...mapToFirestore(
      {
        'time': FieldValue.serverTimestamp(),
      },
    ),
  });
}
