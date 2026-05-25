import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';

class Waitonveriifcation extends StatefulWidget {
  const Waitonveriifcation({super.key});

  @override
  State<Waitonveriifcation> createState() => _WaitonveriifcationState();
}

class _WaitonveriifcationState extends State<Waitonveriifcation> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final verified = FirebaseAuth.instance.currentUser!.emailVerified;
      if (verified) {
        _timer?.cancel();
        Navigator.pushReplacementNamed(context, AppRoutes.verifyId);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTitle(size: 30, title: "Check your email", weight: FontWeight.bold, titleColor: colors.primary, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            CircularProgressIndicator(color: colors.primary),
          ],
        ),
      );
  }
}