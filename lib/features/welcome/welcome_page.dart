import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';


class WelcomePage extends StatelessWidget{

  const WelcomePage({super.key});

  @override 
  Widget build(BuildContext context)
  {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: context.screenWidth * 0.27,
            height: context.screenHeight * 0.12,
            child: SvgPicture.asset('assets/images/logo.svg', fit: BoxFit.contain),
          ),
          SizedBox(height: context.spacer),
          AppTitle(size: 34, title: "Welcome to Makanek!", weight: FontWeight.bold, titleColor: colors.onSurface, textAlign: TextAlign.center), 
          AppText(text: 'A community built for women, by women\nstart sharing your journey today', fontWeight: FontWeight.w400, textColor: colors.onSurface, textAlign: TextAlign.center, textSize: 16),
          SizedBox(height: context.spacer * 8),
          Button(
            onPressed:() => Navigator.pushReplacementNamed(context, AppRoutes.signUp),
            textColor: colors.onPrimary, 
            borderRadius: 28, 
            fontSize: 16, 
            text: 'Get Started', 
            buttonWidth: context.buttonSize, 
            fontWeight: FontWeight.bold, 
            elevation: 6,
            buttonHeight: context.buttonSizeH*0.8
          ),
          SizedBox(height: context.spacer * 0.4),
          Button(
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.logIn),
            textColor: colors.onSecondary, 
            borderRadius: 28, 
            fontSize: 16, 
            text: 'Already have an account', 
            buttonWidth: context.buttonSize, 
            fontWeight: FontWeight.bold, 
            elevation: 6, 
            buttonColor: colors.secondary,
            buttonHeight: context.buttonSizeH *0.8
          ),
          SizedBox(height: context.spacer * 3)
        ],
      )
    );
  }
}