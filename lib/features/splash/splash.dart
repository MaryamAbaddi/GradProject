import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget{

const Splash({super.key});
@override
  State<Splash> createState() => _SplashPageState();

}
class _SplashPageState  extends State<Splash>
{
  
@override
void initState() {
  super.initState();
  Future.delayed(const Duration(seconds: 5), () {
    _navigate();
  });
}

void _navigate() async {
  final prefs = await SharedPreferences.getInstance();
  final seenOnboarding = prefs.getBool('seen_onboarding') ?? false;
  if (!mounted) return;

  if (!seenOnboarding) {
    Navigator.pushReplacementNamed(context, AppRoutes.onBoard);
  } else {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.pushReplacementNamed(context, AppRoutes.main);
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.logIn);
    }
  }
}

@override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body:
      Center(child:SvgPicture.asset('assets/images/logo.svg'))
    );
  }
}