


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/deleteproduct/data/datasrc/deleteproduct_datasrcmeth.dart';

class DeleteProductDatasrcimp implements DeleteProductDatasrcmeth {

  
  @override
  Future<void> deleteProduct(String productId) async {
     return  await  FirebaseFirestore.instance.collection('General').doc(productId).delete();
  }
  
}