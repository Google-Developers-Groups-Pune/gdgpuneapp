import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _userDetail =
          (await secureStorage.getString('ff_userDetail'))?.ref ?? _userDetail;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_loggedInUser') != null) {
        try {
          final serializedData =
              await secureStorage.getString('ff_loggedInUser') ?? '{}';
          _loggedInUser =
              UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

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
        ? secureStorage.setString('ff_userDetail', value.path)
        : secureStorage.remove('ff_userDetail');
  }

  void deleteUserDetail() {
    secureStorage.delete(key: 'ff_userDetail');
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

  List<String> _loggedInUserRoles = [];
  List<String> get loggedInUserRoles => _loggedInUserRoles;
  set loggedInUserRoles(List<String> value) {
    _loggedInUserRoles = value;
  }

  void addToLoggedInUserRoles(String value) {
    loggedInUserRoles.add(value);
  }

  void removeFromLoggedInUserRoles(String value) {
    loggedInUserRoles.remove(value);
  }

  void removeAtIndexFromLoggedInUserRoles(int index) {
    loggedInUserRoles.removeAt(index);
  }

  void updateLoggedInUserRolesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    loggedInUserRoles[index] = updateFn(_loggedInUserRoles[index]);
  }

  void insertAtIndexInLoggedInUserRoles(int index, String value) {
    loggedInUserRoles.insert(index, value);
  }

  UserStruct _loggedInUser = UserStruct();
  UserStruct get loggedInUser => _loggedInUser;
  set loggedInUser(UserStruct value) {
    _loggedInUser = value;
    secureStorage.setString('ff_loggedInUser', value.serialize());
  }

  void deleteLoggedInUser() {
    secureStorage.delete(key: 'ff_loggedInUser');
  }

  void updateLoggedInUserStruct(Function(UserStruct) updateFn) {
    updateFn(_loggedInUser);
    secureStorage.setString('ff_loggedInUser', _loggedInUser.serialize());
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
