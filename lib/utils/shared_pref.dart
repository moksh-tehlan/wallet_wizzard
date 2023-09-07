import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Prefs {
  factory Prefs() {
    return _singleton;
  }

  Prefs._internal() {
    init();
  }

  static late FlutterSecureStorage _prefs;

  static final _singleton = Prefs._internal();

  static Future<void> init() async {
    _prefs = const FlutterSecureStorage();
  }

  static Future<void> clear() {
    return _prefs.deleteAll();
  }

  static Future<void> setOnBoardingVisited() =>
      _prefs.write(key: _onBoarding, value: true.toString());

  static Future<bool> getOnBoardingVisited() async =>
      await _prefs.read(key: _onBoarding) == true.toString();

  static Future<void> setUserExists({required bool userExists}) =>
      _prefs.write(key: _user, value: userExists.toString());

  static Future<bool> getUserExists() async =>
      await _prefs.read(key: _user) == true.toString();
}

const _onBoarding = '_onBoarding';
const _user = '_user';
