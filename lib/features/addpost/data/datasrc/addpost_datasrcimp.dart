



//import 'dart:io';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:makanek/features/addpost/data/datasrc/addpost_datasrcmeth.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';

/*class AddpostDatasrcimp implements AddpostDatasrcmeth {

  final Dio dio;
  AddpostDatasrcimp({required this.dio});
  
  @override
  Future<OutputEntity> addPost(InputEntity input) async {
    final response = await dio.post('https://jsonplaceholder.typicode.com/posts',
    data: {
      'title' : input.title,
      'body' : input.body
    } );
    return OutputEntity(body: response.data['body'], title: response.data['title'], id: response.data['id']);//id is returned automatically
  }
}*/

class AddpostDatasrcimp  implements AddpostDatasrcmeth{
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  const AddpostDatasrcimp({required this.firestore,required this.storage});

  @override
  Future<OutputEntity> addPost(InputEntity input) async {
    String? imageUrl;

    if(input.imagePath != null)
     {
      final ref = storage.ref().child('posts/${DateTime.now().millisecondsSinceEpoch}');
      await ref.putFile(File(input.imagePath!));
      imageUrl = await ref.getDownloadURL();
    }
    final docRef = await firestore.collection('posts').add({
      'content': input.body,
      'ImageURL': imageUrl,
      'CreatedAt': FieldValue.serverTimestamp(),
    });
    return OutputEntity(body: input.body, imageUrl: imageUrl, id: docRef.id, createdAt: DateTime.now());
  }
}