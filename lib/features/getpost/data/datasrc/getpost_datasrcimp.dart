




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/getpost/data/datasrc/getpost_datasrcmeth.dart';



class GetpostDatasrcimp implements GetpostDatasrcmeth {
  final FirebaseFirestore firestore;

  GetpostDatasrcimp({required this.firestore});

  @override
  Future<List<OutputEntity>> getPost() async {
    final snapshot = await firestore
        .collection('posts')
        .orderBy('CreatedAt', descending: true)
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return OutputEntity(
        id: doc.id,
        body: data['content'] as String? ?? '',
       imageUrl: data['ImageURL'],
        createdAt: (data['CreatedAt'] as Timestamp).toDate(), 
        uid: data['userId'],
      );
    }).toList();
  }
}