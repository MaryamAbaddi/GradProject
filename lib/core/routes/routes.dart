import 'package:flutter/material.dart';
import 'package:makanek/features/coursepage1/presentation/page/course1_page.dart';
import 'package:makanek/features/editprofilepage/presentation/page/editprofile_page.dart';
import 'package:makanek/features/getproduct/presentation/page/getproduct_page.dart';
import 'package:makanek/features/getservice/presentation/page/getservice_page.dart';
import 'package:makanek/features/home/presentation/widgets/homepage_layout.dart';
import 'package:makanek/features/getpost/presentation/pages/getpost_page.dart';
import 'package:makanek/features/login/presentation/pages/login_screen.dart';
import 'package:makanek/features/main/presentation/pages/main_container.dart';
import 'package:makanek/features/onboarding/presentation/pages/onboard_screen.dart';
import 'package:makanek/features/signup/presentation/pages/signup_screen.dart';
import 'package:makanek/features/splash/splash.dart';
import 'package:makanek/features/verificationpage/presentation/page/verifybyid_page.dart';
import 'package:makanek/features/waitonverification/waitonveriifcation.dart';
import 'package:makanek/features/welcome/welcome_page.dart';

class AppRoutes {
  static const splash = '/';
  static const welcome = '/welcome';
  static const signUp = '/signup';
  static const logIn = '/login';
  static const onBoard = '/onboard';
  static const home = '/home';
  static const setting = '/settings';
  static const addPost = '/addPost';
  static const getPost = '/getPost';
  static const main = '/main';
  static const service = '/service';
  static const product = '/product';
  static const courses1 = '/courses1';
  static const editProfile = '/editProfile';
  static const verify  = '/verify';
    static const verifyId  = '/verifyId';

  

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const Splash());
      //case setting:
        //return MaterialPageRoute(builder: (_) => const SettingScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      case main:
        return MaterialPageRoute(builder: (_) => const MainContainer());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case logIn:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case onBoard:
        return MaterialPageRoute(builder: (_) => const OnboardScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case getPost: 
      return MaterialPageRoute(builder: (_) => const CommunityPage());
      case product:
        return MaterialPageRoute(builder: (_) =>  GetproductPage());
      case service:
        return MaterialPageRoute(builder: (_) =>  GetservicePage());
      case courses1:
        return MaterialPageRoute(builder: (_) => const Course1Page());
      case editProfile:
        return MaterialPageRoute(builder: (_) => const EditprofilePage());
      case verify:
        return MaterialPageRoute(builder: (_) => const Waitonveriifcation());
      case verifyId:
        return MaterialPageRoute(builder: (_) => const VerifybyidPage());
      default:
        return MaterialPageRoute(builder: (_) => const Splash());
    }
  }
}