import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;
  ThemeData _currentData;

  ThemeChanger(int index) {
    switch (index) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentData = ThemeData.light();
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentData = ThemeData.dark();
        break;
      case 3:
        _darkTheme = false;
        _customTheme = false;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentData = ThemeData.light();
    }
  }

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;
  ThemeData get currentData => this._currentData;

  set darkTheme(bool value) {
    this._customTheme = false;
    this._darkTheme = value;
    this._currentData = (value) ? ThemeData.dark() : ThemeData.light();

    notifyListeners();
  }

  set customTheme(bool value) {
    this._customTheme = value;
    this._darkTheme = false;
    this._currentData = (value) ? ThemeData.light() : ThemeData.light();
    notifyListeners();
  }
}
