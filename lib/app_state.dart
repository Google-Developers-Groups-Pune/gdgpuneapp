import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userDetail = prefs.getString('ff_userDetail')?.ref ?? _userDetail;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool value) {
    _searchActive = value;
  }

  DocumentReference? _userDetail;
  DocumentReference? get userDetail => _userDetail;
  set userDetail(DocumentReference? value) {
    _userDetail = value;
    value != null
        ? prefs.setString('ff_userDetail', value.path)
        : prefs.remove('ff_userDetail');
  }

  String _eventName = 'DevFest 2024';
  String get eventName => _eventName;
  set eventName(String value) {
    _eventName = value;
  }

  String _liveEventStatus = 'live';
  String get liveEventStatus => _liveEventStatus;
  set liveEventStatus(String value) {
    _liveEventStatus = value;
  }

  String _upcomingEventStatus = 'upcoming';
  String get upcomingEventStatus => _upcomingEventStatus;
  set upcomingEventStatus(String value) {
    _upcomingEventStatus = value;
  }

  String _endedEventStatus = 'ended';
  String get endedEventStatus => _endedEventStatus;
  set endedEventStatus(String value) {
    _endedEventStatus = value;
  }

  String _feedbackItemText = 'text';
  String get feedbackItemText => _feedbackItemText;
  set feedbackItemText(String value) {
    _feedbackItemText = value;
  }

  String _feedbackItemRating = 'rating';
  String get feedbackItemRating => _feedbackItemRating;
  set feedbackItemRating(String value) {
    _feedbackItemRating = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
