


import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';

class AdCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const AdCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              // ignore: deprecated_member_use
              Colors.black.withOpacity(0.6),
              Colors.transparent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(text: title,fontWeight: FontWeight.bold,textColor: Colors.white,),
            SizedBox(height:10 ,),
            AppText(
               text: subtitle,textAlign: TextAlign.start,textColor:Colors.white),
          ],
        ),
      ),
    );
  }
}