



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/getcartitems/data/datasrc/getcartitems_datasrcmeth.dart';
import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';

class GetcartitemsDatasrcimp implements GetcartitemsDatasrcmeth {
  final FirebaseFirestore firebase;
  final uid = FirebaseAuth.instance.currentUser!.uid;
  GetcartitemsDatasrcimp({required this.firebase});
  
  @override
  Future<List<GetCartOutput>> getcartItems() async {
    final snapshot = await firebase
      .collection('users')
      .doc(uid)
      .collection('Cart')
      .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return GetCartOutput(
      docId: doc.id,
      itemId: data['itemId'], 
      name:data['name'] , 
      price: data['price'],
      image: data['image']);
    }).toList();
  }
}