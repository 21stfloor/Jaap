import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

DateTime addOneMonth(DateTime date) {
  int newYear = date.year;
  int newMonth = date.month + 1;

  if (newMonth > 12) {
    newYear += 1;
    newMonth = 1;
  }

  // Handle the case where the resulting day does not exist in the new month (e.g., February 30)
  int newDay = date.day;
  int daysInNewMonth = DateTime(newYear, newMonth + 1, 0).day;
  if (newDay > daysInNewMonth) {
    newDay = daysInNewMonth;
  }

  return DateTime(newYear, newMonth, newDay);
}

int calculateAverageRating(
  int ratingCount,
  int totalRating,
) {
  if (ratingCount == 0) {
    return 0; // Return 0 if there are no ratings to avoid division by zero
  }

  double average = totalRating / ratingCount;

  // Clamp the average to the range 0-5
  if (average > 5) {
    average = 5;
  } else if (average < 0) {
    average = 0;
  }

  return average.round();
}
