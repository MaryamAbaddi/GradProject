import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_bloc.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_events.dart';
import 'package:makanek/features/verificationpage/presentation/widget/verifybyid_upload.dart';

class VerifybyidLayout extends StatefulWidget {
  const VerifybyidLayout({super.key});

  @override
  State<VerifybyidLayout> createState() => _VerifybyidLayoutState();
}

class _VerifybyidLayoutState extends State<VerifybyidLayout> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTitle(size: 30, title: 'Verify Your Identity', weight: FontWeight.bold, titleColor: colors.primary, textAlign: TextAlign.center),
            SizedBox(height: context.vertical / 2),
            Image.asset('assets/images/verify.png'),
            SizedBox(height: context.vertical / 2),
            AppText(text: 'To maintain a safe and exclusive space for\n women, please upload a photo of your ID', textSize: 15),
            SizedBox(height: context.vertical / 2),
            VerifybyidUpload(onImagePicked: (file) {
              setState(() {
                _image = file;
              });
            }),
            SizedBox(height: context.vertical / 3),
            AppText(text: "Your data is encrypted and used for verification only", fontWeight: FontWeight.w700, textSize: 10),
            SizedBox(height: context.vertical / 3),
            Button(
              onPressed: () {
                if (_image != null) {
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  context.read<VerifybyidBloc>().add(
                    VerfiybyIdSubmitted(uid: uid, imageUrl: _image!),
                  );
                }
              },
              textColor: colors.onPrimary,
              borderRadius: 24,
              fontSize: 18,
              text: "Submit for review",
              buttonWidth: context.buttonSize,
              buttonHeight: context.buttonSizeH,
              fontWeight: FontWeight.bold,
              elevation: 4,
            ),
          ],
        ),
      ),
    );
  }
}