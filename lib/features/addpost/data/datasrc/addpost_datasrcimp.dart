import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:makanek/features/addpost/data/datasrc/addpost_datasrcmeth.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';


class AddpostDatasrcimp  implements AddpostDatasrcmeth{
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
 AddpostDatasrcimp({required this.firestore,required this.storage});

  @override
  Future<OutputEntity> addPost(InputEntity input) async {
      final uid = FirebaseAuth.instance.currentUser!.uid;

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
      'OwnerId':uid,
      'LikesCount' : 0,
    });
    return OutputEntity(body: input.body, imageUrl: imageUrl, id: docRef.id, createdAt: DateTime.now(), uid: uid, likescount: 0);
  }
}