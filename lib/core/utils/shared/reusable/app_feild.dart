




import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';

class AppFeild extends StatelessWidget {

final String? Function(String?)? validator;
 final TextEditingController controller;
 final double buttonWidth;
 final double buttonHeight;
  final TextInputType keyboardType;
  final TextInputAction action;
  final String hintText;

  const AppFeild({super.key, required this.controller, required this.keyboardType, required this.action, required this.hintText, this.validator, required this.buttonWidth, required this.buttonHeight});

  @override 
  Widget build(BuildContext context)
  {
    return SizedBox(
    width:buttonWidth,
    height: buttonHeight,
    child:TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      textInputAction: action,
      decoration: InputDecoration(
      filled: true,
      fillColor: const Color.fromARGB(234, 228, 228, 228),
      hint: AppText(text: hintText,fontWeight: FontWeight.w400,textColor:Colors.grey,),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
      )
      ),
    ));  

  }





}