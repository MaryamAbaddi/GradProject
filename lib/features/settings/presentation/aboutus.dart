




import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
   return Scaffold(
    backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 90,
        titleSpacing: 50,
        title: AppText(text: 'About us', fontWeight: FontWeight.bold, textSize: 16,textColor: colors.primary,),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
            child: Row(children: [
              Icon(Icons.arrow_back_ios, color: colors.primary),
              AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),]))),),
              body: Padding(padding: EdgeInsets.all(16),
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(textSize: 12,fontWeight: FontWeight.w700,textAlign: TextAlign.start,text: "Makanek (مكانك) is a platform built to support and elevate home-based businesses and talented women within our community. The app's name translates to 'Your Place' reflecting the belief that every woman with a unique craft, skill, or service deserves a trusted space to showcase her work and achieve financial independence directly from home. By focusing on simplicity and accessibility, it seamlessly bridges the gap between passionate local entrepreneurs and supportive buyers."),
                  SizedBox(height:context.vertical),
                  AppText(textSize: 12,fontWeight: FontWeight.w700,textAlign: TextAlign.start,text: "The platform breaks down technical and cultural barriers by combining a user-friendly marketplace with dedicated tools for personal and professional growth. Women of all technological skill levels can easily manage their products or services while maintaining complete respect for their values and personal circumstances. Beyond e-commerce, it emphasizes continuous development by offering tailored educational courses directly within the app."),
                  SizedBox(height:context.vertical),
                  AppText(textSize: 12,fontWeight: FontWeight.w700,textAlign: TextAlign.start,text: "At its heart, the system functions as a safe, culturally sensitive ecosystem centered around shared success. It fosters a strong community network where users can form interest-based groups, exchange advice, and find mentorship. Makanek is engineered to turn home-based creativity into lasting achievement, providing a specialized space where women can confidently connect, grow, and thrive." )
                ],
              ),
   ));
  }

  
}