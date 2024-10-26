import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<String> _f = [];
  List<String> get f => _f;
  set f(List<String> value) {
    _f = value;
  }

  bool _shownAlert = false;
  bool get shownAlert => _shownAlert;
  set shownAlert(bool value) {
    _shownAlert = value;
  }

  //  void setShownAlert(bool value) {
  //   shownAlert.set(value);
  // }

  void addToF(String value) {
    f.add(value);
  }

  void removeFromF(String value) {
    f.remove(value);
  }

  void removeAtIndexFromF(int index) {
    f.removeAt(index);
  }

  void updateFAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    f[index] = updateFn(_f[index]);
  }

  void insertAtIndexInF(int index, String value) {
    f.insert(index, value);
  }

  double _price = 0.0;
  double get price => _price;
  set price(double value) {
    _price = value;
  }

  int _chatListIndex = 0;
  int get chatListIndex => _chatListIndex;
  set chatListIndex(int value) {
    _chatListIndex = value;
  }

  List<DocumentReference> _SearchFilterLocations = <DocumentReference>[];
  List<DocumentReference> get SearchFilterLocations => _SearchFilterLocations;
  set SearchFilterLocations(List<DocumentReference> value) {
    _SearchFilterLocations = value;
  }

  void addToSearchFilterLocations(DocumentReference value) {
    SearchFilterLocations.add(value);
  }

  void removeFromSearchFilterLocations(DocumentReference value) {
    SearchFilterLocations.remove(value);
  }

  void removeAtIndexFromSearchFilterLocations(int index) {
    SearchFilterLocations.removeAt(index);
  }

  void updateSearchFilterLocationsAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    SearchFilterLocations[index] = updateFn(_SearchFilterLocations[index]);
  }

  void insertAtIndexInSearchFilterLocations(int index, DocumentReference value) {
    SearchFilterLocations.insert(index, value);
  }
}
