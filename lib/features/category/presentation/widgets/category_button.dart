



import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';

class CategoryButton extends StatelessWidget {

  final String imagePath;
  final String title;

  const CategoryButton({super.key,
  required this.imagePath,
  required this.title});

  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24), 
        child: Column( children: [
        CircleAvatar(
        radius: 40,
      backgroundImage: AssetImage(imagePath),),
      SizedBox(height: context.spacer/2,),
        Text(title,style: TextStyle(fontSize:12,fontWeight: FontWeight.w700),),
        ]
      )
    )
    );
  }
}