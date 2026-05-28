import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OwnerName extends StatelessWidget {
  final String ownerId;

  const OwnerName({super.key, required this.ownerId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(ownerId).get(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox();
        final name = snapshot.data?['UserName'] ?? '';
        return Text(name);
      },
    );
  }
}