import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/addpurchases/data/datasrc/addpurchases_datasrcmeth.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_input.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:intl/intl.dart';

class AddpurchasesDatasrcimp implements AddpurchasesDatasrcmeth {
  final FirebaseFirestore firestore;
  final user = FirebaseAuth.instance.currentUser!.uid;

  AddpurchasesDatasrcimp({required this.firestore});

  @override
  Future<Addpurchasesoutput> addPurchases(AddpurchasesInput input) async {
    final docRef = firestore
        .collection('users')
        .doc(user)
        .collection('UserPurchases')
        .doc();

    await docRef.set({
      'title': input.title,
      'price': input.price,
      'date': DateFormat('EEE, MMM d').format(DateTime.now()),
      'imageUrl': input.imageUrl,
    });

    return Addpurchasesoutput(
      uid: docRef.id,
      title: input.title,
      price: input.price,
      date: DateFormat('EEE, MMM d').format(DateTime.now()),
      imageUrl: input.imageUrl,
    );
  }
}