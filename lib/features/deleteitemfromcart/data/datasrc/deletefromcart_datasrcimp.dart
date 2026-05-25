




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/deleteitemfromcart/data/datasrc/deletefromcart_datasrcmeth.dart';
import 'package:makanek/features/deleteitemfromcart/domain/entity/deletefromcart_input.dart';

class DeletefromcartDatasrcimp implements DeletefromcartDatasrcmeth{
  final FirebaseFirestore firestore;
  final uid = FirebaseAuth.instance.currentUser!.uid;


  DeletefromcartDatasrcimp({required this.firestore});
  @override
  Future<void> deleteFromCart(DeletefromcartInput input) async {
      return await firestore.collection('users').doc(uid).collection('Cart').doc(input.docId).delete();
  }
  
} 