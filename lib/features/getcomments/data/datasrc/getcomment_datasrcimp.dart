



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';
import 'package:makanek/features/getcomments/data/datasrc/getcomment_datasrcmeth.dart';

class GetcommentDatasrcimp implements GetcommentDatasrcmeth {

  final FirebaseFirestore firestore;
  GetcommentDatasrcimp({required this.firestore});

  @override
  Future<List<CommentOutput>> getcomment(String postId) async {
    final snapshot =  await firestore.collection('posts').doc(postId).collection('comments').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return CommentOutput(
        id: doc.id,
        comment: data['comment'],
        userId: data['userId'],
        createdAt: (data['createdAt'] as Timestamp).toDate(),
      );
    }).toList();
  }


  
}