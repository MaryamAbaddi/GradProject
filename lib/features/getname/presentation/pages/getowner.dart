import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';

class OwnerName extends StatelessWidget {
  final String ownerId;

  const OwnerName({super.key, required this.ownerId});

  @override
  Widget build(BuildContext context) {
        final colors = Theme.of(context).colorScheme;
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        final name = snapshot.data?['UserName'] ?? '';
        return AppText( text: name,fontWeight: FontWeight.bold,textColor: colors.primary,textSize: 14,);
      },
    );
  }
}