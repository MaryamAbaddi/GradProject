



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/addtocart/data/datasrc/addtocart_datasrcmeth.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_output.dart';

class AddtocartDatasrcimp implements AddtocartDatasrcmeth {
  final FirebaseFirestore firebase;
  final uid = FirebaseAuth.instance.currentUser!.uid;


  AddtocartDatasrcimp({required this.firebase});
  @override
  Future<AddtocartOutput> addtocart(AddtocartInput input) async {
  final snapshot = await firebase.collection('General').doc(input.itemId).get();
  final data = snapshot.data();
  final name = data?['Title'] ?? data?['serviceType'];
  final price = data?['price'] ?? data?['priceService'];

  await firebase.collection('users').doc(uid).collection('cart').add({
    'itemId': input.itemId,
    'name': name,
    'price': price,
  });
  return AddtocartOutput(success: true);
}
}