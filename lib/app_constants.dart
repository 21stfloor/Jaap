import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

abstract class FFAppConstants {
  static const String userTypeAgency = 'agency';
  static const String userTypeAdmin = 'admin';
  static const String userTypeApplicant = 'applicant';
  static const double subscriptionFee = 199.0;
  static const List<String> adminEmails = [
    'jaapadmin@gmail.com',
    'elma@ollness.com'
  ];
  static const int maxInvalidLoginRetries = 2;
  static const String defaultImage =
      'https://firebasestorage.googleapis.com/v0/b/jaap-h3fa31.appspot.com/o/449133811_969639548177226_1356168894052321592_n%20(1).jpg?alt=media&token=41943bb5-d21d-42a4-873b-961dbcfb5091';
  static const String paymentMethodGcash = 'gcash';
  static const String paymentMethodCard = 'card';
  static const String paymentMethodPaypal = 'paypal';
  static const String regionAll = 'World';
  static const String regionAsia = 'Asia';
  static const String defaultJobTitle = 'Unemployed';
  static const String hireStatusActive = 'active';
  static const String hiredStatusTerminated = 'terminated';
  static const List<String> jobTypes = [
    'Full time',
    'Contract/Temp',
    'Part time',
    'Casual/Vacation'
  ];
  static const String statusHired = 'Hired';
  static const String statusNotHired = 'Not Hired';
  static const String statusJobHunting = 'Job Hunting';
  static const String statusDeployed = 'Deployed';
  static const List<int> daysFilter = [-1, 1, 3, 7, 14, 30];
}
