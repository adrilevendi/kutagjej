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
import '/auth/firebase_auth/auth_util.dart';

bool? isFavoriteProf(
  DocumentReference? userToCheckId,
  List<DocumentReference> users,
) {
  for (var user in users) {
    if (user == userToCheckId) {
      return true;
    }
  }
  return false;
}

String? genRefCode(int length) {
  var r = math.Random();
  return String.fromCharCodes(
      List.generate(length, (index) => r.nextInt(33) + 89));
}

double? getAvgRating(List<ReviewRecord> reviews) {
  double rating = 0;
  var count = 0;
  for (var r in reviews) {
    rating += r.rating;
    count++;
  }
  return rating / count;
}

String? getPostDuration(
  DateTime? startTime,
  int? nofDays,
) {
  var duration = '';
  var timeleft;

  return timeleft;
}
