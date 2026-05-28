import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:makanek/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:makanek/core/connectivity/page/connectivity_page.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/notification/notification_service.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/theme/light_theme.dart';
import 'package:makanek/core/theme/them_cubit.dart';
import 'package:makanek/firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await setupDi();
  await NotificationService.init();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (_) => getIt<ConnectivityCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            builder: (context, child) => ConnectivityPage(child: child!),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: AppRoutes.splash,
            debugShowCheckedModeBanner: false,
            themeMode: themeMode,
            theme: AppTheme.lightTheme,
          );
        }
      )
    );
  }
}


            
        