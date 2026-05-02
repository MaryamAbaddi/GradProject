import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/core/theme/them_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late ThemeCubit cubit;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    cubit = ThemeCubit(mockPrefs);
  });

  tearDown(() => cubit.close());

  test('initial state should be ThemeMode.light', () {
    expect(cubit.state, ThemeMode.light);
  });
}