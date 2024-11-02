import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
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
      _roleTypeSelected =
          prefs.getString('ff_roleTypeSelected') ?? _roleTypeSelected;
    });
    _safeInit(() {
      _failedLoginCount =
          prefs.getInt('ff_failedLoginCount') ?? _failedLoginCount;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _roleTypeSelected = '';
  String get roleTypeSelected => _roleTypeSelected;
  set roleTypeSelected(String value) {
    _roleTypeSelected = value;
    prefs.setString('ff_roleTypeSelected', value);
  }

  int _failedLoginCount = 0;
  int get failedLoginCount => _failedLoginCount;
  set failedLoginCount(int value) {
    _failedLoginCount = value;
    prefs.setInt('ff_failedLoginCount', value);
  }

  String _displayNameToRegister = '';
  String get displayNameToRegister => _displayNameToRegister;
  set displayNameToRegister(String value) {
    _displayNameToRegister = value;
  }

  bool _hasSubscription = false;
  bool get hasSubscription => _hasSubscription;
  set hasSubscription(bool value) {
    _hasSubscription = value;
  }

  final _userDocQueryManager = FutureRequestManager<UsersRecord>();
  Future<UsersRecord> userDocQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<UsersRecord> Function() requestFn,
  }) =>
      _userDocQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserDocQueryCache() => _userDocQueryManager.clear();
  void clearUserDocQueryCacheKey(String? uniqueKey) =>
      _userDocQueryManager.clearRequest(uniqueKey);
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
