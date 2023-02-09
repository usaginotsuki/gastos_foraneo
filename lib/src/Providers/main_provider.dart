import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier {
  String _token = "";
  bool _modeOsc = false;

  bool get mode {
    return _modeOsc;
  }

  set mode(bool value) {
    _modeOsc = value;
    notifyListeners();
  }

  String get token {
    return _token;
  }

  Future<bool> getPreferences() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _modeOsc = prefs.getBool("mode") ?? true;
      _token = prefs.getString("token") ?? "";
      return true;
    } catch (e) {
      return false;
    }
  }

  set token(String newToken) {
    updateToken(newToken);
    _token = newToken;
    notifyListeners();
  }

  Future<void> updateToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("token", token);
  }
}
