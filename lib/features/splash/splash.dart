import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makanek/core/routes/routes.dart';

class Splash extends StatefulWidget{

const Splash({super.key});
@override
  State<Splash> createState() => _SplashPageState();

}
class _SplashPageState  extends State<Splash>
{
  
@override
  void initState(){
  super.initState();
  Future.delayed(const Duration(seconds: 5), () {
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.onBoard);
  });
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