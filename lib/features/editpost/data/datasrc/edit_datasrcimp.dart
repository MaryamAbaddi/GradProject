



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/editpost/data/datasrc/edit_datasrcmeth.dart';

class EditDatasrcimp implements EditDatasrcmeth {
  final FirebaseFirestore firestore;
  EditDatasrcimp({required this.firestore});
  
  @override
  Future<void> editpost(String postId,String newBody) async {
     await firestore.collection('posts').doc(postId).update({
      'content': newBody}
    );
  }
  
}