



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/addcomment/data/datasrc/addcomment_datasrcmeth.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_input.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

class AddcommentDatasrcimp implements AddcommentDatasrcmeth{
    final FirebaseFirestore firestore;

  AddcommentDatasrcimp({required this.firestore});
  @override
  Future<CommentOutput> addComment(AddcommentInput input) async {
    final docRef = await firestore.collection('posts').doc(input.postId).collection('comments').add({
      'userId':input.userId,
      'comment':input.comment,
      'createdAt':FieldValue.serverTimestamp(),
    });
    
    return CommentOutput(id: docRef.id, comment: input.comment, userId: input.userId, createdAt:DateTime.now());
  }

  
} 