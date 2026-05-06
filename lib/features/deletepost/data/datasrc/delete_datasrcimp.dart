



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/deletepost/data/datasrc/delete_datasrcmeth.dart';

class DeleteDatasrcimp implements DeleteDatasrcmeth{
  final FirebaseFirestore firestore;
  const DeleteDatasrcimp({required this.firestore,
  });

  @override
  Future<void> deletepost(String postId) async {

    return await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
  }



  
} 