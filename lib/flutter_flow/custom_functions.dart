import 'dart:math' as math;

import '/backend/backend.dart';

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
