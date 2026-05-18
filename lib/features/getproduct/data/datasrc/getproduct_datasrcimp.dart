



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';
import 'package:makanek/features/getproduct/data/datasrc/getproduct_datasrcmeth.dart';

class GetproductDatasrcimp implements GetProductDatasrcmeth {
  final FirebaseFirestore firestore;

  GetproductDatasrcimp({required this.firestore});

  @override
  Future<List<AddproductOutput>> getProduct() async {
    final snapshot = await firestore
        .collection('General')
        .get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      return AddproductOutput(
  id: doc.id,
  body: data['description'] as String? ?? '',
  imageUrl:data['ImageURL'] as String? ?? '',
  title: data['Title'],
  price: (data['price'] as num?)?.toDouble() ?? 0.0,
);
    }).toList();
  }
}