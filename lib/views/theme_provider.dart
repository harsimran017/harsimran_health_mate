import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static final ThemeData defaultTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white12,
      // Set the app bar color
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(fontSize: 20),
    ),
  );
  late ThemeData _themeData;

  ThemeProvider() {
    _themeData = defaultTheme;
    _loadThemePreference();
  }

  ThemeData get themeData => _themeData;

  Future<void> toggleTheme() async {
    if (_themeData == defaultTheme) {
      _themeData = darkTheme;
    } else {
      _themeData = defaultTheme;
    }

    notifyListeners();
    _saveThemePreference();
  }

  void _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _themeData == ThemeData.dark());
  }

  void _loadThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

    _themeData = isDarkMode ? darkTheme : defaultTheme;
  }
}