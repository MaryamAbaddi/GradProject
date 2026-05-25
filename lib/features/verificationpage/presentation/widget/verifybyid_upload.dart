



import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';

class VerifybyidUpload extends StatefulWidget {
        final Function(File) onImagePicked;

  const VerifybyidUpload({super.key, required this.onImagePicked});

  @override
  State<StatefulWidget> createState() => _VerifybyidUploadState();
  
}


class _VerifybyidUploadState extends State<VerifybyidUpload>{
  File? _image;
  _VerifybyidUploadState();


  @override 
  Widget build(BuildContext context)
  {
    final colors = Theme.of(context).colorScheme;
    return GestureDetector(
        onTap:() async{
        final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(picked != null)
        {
          setState((){
            _image = File(picked.path);
          });
          widget.onImagePicked(File(picked.path));

        }
        }
        ,child: _image != null
    ? ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: SizedBox(
      width: context.screenWidth * 0.8,
      height: context.screenHeight / 5,
      child: Image.file(_image!, fit: BoxFit.cover),
    ),
  )
    : DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: colors.primary,
        strokeWidth: 1.5,
        dashPattern: const [8, 4],
        child: Container(
          width: context.screenWidth * 0.8,
          height: context.screenHeight / 5,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 254, 212, 212),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.badge_outlined, size: 60, color: colors.primary),
              const SizedBox(height: 8),
              AppText(text: 'Tap to upload a photo',textColor: colors.primary,fontWeight: FontWeight.bold,),
            ],
          ),
        ),
      ),
    );
  }
}