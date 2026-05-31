import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';





class AppCard extends StatelessWidget{
  final String imagePath;
  final String title;
  final String body; 
  final VoidCallback? onEnroll;
  final bool flag;

  const AppCard({
  super.key, 
 this.flag = false,
  required this.body,
  required this.imagePath,
  required this.title, this.onEnroll,
});
  
  @override 
  Widget build(BuildContext context)
  {
        final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height:context.vertical*2.75,
      child: Card(
        margin: EdgeInsets.all(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        ),
        elevation: 2,
        color: Colors.white,
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Image.asset(imagePath),
        SizedBox(width:20),
        Expanded( 
      child:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height:15),
        AppTitle(size: 20, title: title, weight: FontWeight.bold, titleColor:Colors.black, textAlign: TextAlign.start),
        Flexible(
        child: AppText(text: body,textAlign: TextAlign.start,textSize: 12,),),
        Row(children: [Spacer(),
                flag 
          ? TextButton(onPressed: onEnroll, child: Button( isText: true,textColor: colors.primary, fontSize: 16, text:'Enroll', borderRadius: 0, buttonWidth: 0, buttonHeight: 0, fontWeight: FontWeight.bold, elevation: 12,))
          : IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right_rounded, color: colors.primary))
                ],)]
                )
      )]
        
      )
    )
    );
  }

  
}

