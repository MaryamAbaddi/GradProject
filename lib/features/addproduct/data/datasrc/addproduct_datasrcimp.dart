







import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:makanek/features/addproduct/data/datasrc/addproduct_datasrcmeth.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_input.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';

class AddProductDatasrcimp  implements AddproductDatasrcmeth{
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final uid = FirebaseAuth.instance.currentUser!.uid;
 AddProductDatasrcimp({required this.firestore,required this.storage});

  @override
  Future<AddproductOutput> addProduct(AddproductInput input) async {

    String imageUrl;

      
      final ref = storage.ref().child('General/${DateTime.now().millisecondsSinceEpoch}');
      await ref.putFile(File(input.imagePath));
      imageUrl = await ref.getDownloadURL();
      
  
    final docRef = await firestore.collection('General').add({
      'Title':input.title,
      'description': input.body,
      'ImageURL': imageUrl,
      'OwnerId':uid,
      'price':input.price
    });
    return AddproductOutput(body: input.body, imageUrl: imageUrl, id: docRef.id, title: input.title, price:input.price);
  }
}