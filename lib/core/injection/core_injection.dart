import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:makanek/core/injection/addpost_injection.dart';
import 'package:makanek/core/injection/avatar_injection.dart';
import 'package:makanek/core/injection/getname_injection.dart';
import 'package:makanek/core/injection/getpost_injection.dart';
import 'package:makanek/core/injection/services1_injection.dart';
import 'package:makanek/core/theme/them_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:makanek/core/injection/login_injection.dart';
import 'package:makanek/core/injection/category_injection.dart';
import 'package:makanek/core/injection/onboard_injection.dart';
import 'package:makanek/core/injection/signup_injection.dart';

final getIt = GetIt.instance;
Future<void> setupDi() async {
  try {
    final prefs = await SharedPreferences.getInstance();

    getIt.registerSingleton(prefs);
    getIt.registerSingleton(FirebaseAuth.instance);
    getIt.registerLazySingleton(() => FirebaseFirestore.instance);
    getIt.registerSingleton<ThemeCubit>(ThemeCubit(prefs)); 

    initLoginInjection();
    initSignupInjection();
    initOnboardingInjection();
    initCategoryInjection();
    initGetnameInjection();
    initAvatarInjection();
    initGetPostInjection();
    initAddPostInjection();
    initService1Injection();
  } catch (e) {
    print("DI ERROR: $e");
  }
}