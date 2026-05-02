import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  final SharedPreferences _prefs;
  static const key = 'isDark';

  ThemeCubit(this._prefs) : super(ThemeMode.light);

  Future<void> loadTheme() async {
    final isDark = _prefs.getBool(key) ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    final isDark = state == ThemeMode.dark;
    _prefs.setBool(key, !isDark);
    emit(isDark ? ThemeMode.light : ThemeMode.dark);
  }
}