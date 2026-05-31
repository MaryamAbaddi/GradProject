import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';


class BottomBar extends StatelessWidget {
  final String title;
  final VoidCallback onNext;
  final String text;
  final double size;
  final double sizeT;
  final Color color1;
  final FontWeight weight;
  final Color cButtontext;
  final double buttonWidth;
  final double borderRaduis;
  final double fontSize;
  final FontWeight fontWeight;
  final double elevation;
  final Color textColor;

  const BottomBar({
    super.key,
    required this.onNext,
    required this.title,
    required this.text,
    required this.color1,
    required this.size,
    required this.sizeT,
    required this.weight,
    required this.cButtontext,
    required this.buttonWidth,
    required this.borderRaduis,
    required this.fontSize,
    required this.fontWeight,
    required this.elevation,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      height: context.screenHeight * 0.25,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(15),
        color: Colors.white,
      ),
      child:Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTitle(
            title: title,
            size: size,
            weight: weight,
            titleColor: color1, 
            textAlign:TextAlign.center,
            
          ),
          SizedBox(height: 10),
          AppText(
            text: text,
            textSize: sizeT,
            fontWeight: FontWeight.w400,
            textColor: color1,
          ),
          SizedBox(height: 20),
         Row(
          
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
          Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Button(
            onPressed: onNext,
            textColor: textColor,
           borderRadius: borderRaduis,
            fontSize: fontSize,
            text: 'Next',
            buttonWidth: buttonWidth,
            fontWeight: fontWeight,
            elevation: elevation, 
            buttonHeight: context.buttonSizeH*0.9,
          ))]),
        ],
      ),
    )
    );
  }
}