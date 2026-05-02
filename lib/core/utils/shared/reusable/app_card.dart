import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';





class AppCard extends StatelessWidget{
  final String imagePath;
  final String title;
  final String body; 

  const AppCard({
  super.key, 
  required this.body,
  required this.imagePath,
  required this.title,
});
  
  @override 
  Widget build(BuildContext context)
  {
        final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height:context.vertical*3,
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
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height:15),
        AppTitle(size: 20, title: title, weight: FontWeight.bold, titleColor:Colors.black, textAlign: TextAlign.start),
        AppText(text: body,textAlign: TextAlign.start,textSize: 12,),
        Row(children: [Spacer(),IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right_rounded,color: colors.primary,))],)]
        )
      )]
        
      )
    )
    );
  }

  
}

