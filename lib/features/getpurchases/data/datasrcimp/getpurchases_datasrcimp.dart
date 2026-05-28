

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:makanek/features/getpurchases/data/datasrcimp/getpurchases_datasrcmeth.dart';

class GetpurchasesDatasrcimp implements GetpurchasesDatasrcmeth{
  final FirebaseFirestore firebase;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  GetpurchasesDatasrcimp({ required this.firebase});
  
  @override
  Future<List<Addpurchasesoutput>> getPurchases() async
  {
    final snapshot = await firebase
      .collection('users')
      .doc(uid)
      .collection('UserPurchases')
      .get();
      
      return snapshot.docs.map((doc){
        final data = doc.data();
        return Addpurchasesoutput(
          title: data['title'], 
        price: data['price'], 
        date: data['date'], 
        imageUrl: data['imageUrl'], 
        uid: doc.id);
      }
      ).toList();

  }
  
}