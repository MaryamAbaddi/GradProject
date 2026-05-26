


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/search/data/dataSrc/datasrc_meth.dart';
import 'package:makanek/features/search/domain/entities/search_inentity.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';

class DatasrcImp implements DatasrcMeth{

  final FirebaseFirestore firestore;
  DatasrcImp({required this.firestore});

  @override
Future<List<SearchResultEntity>> search(SearchInentity input) async {
  final byTitle = await firestore
      .collection('General')
      .where('Title', isGreaterThanOrEqualTo: input.query)
      .where('Title', isLessThanOrEqualTo: '${input.query}\uf8ff')
      .get();

  final byServiceType = await firestore
      .collection('General')
      .where('serviceType', isGreaterThanOrEqualTo: input.query)
      .where('serviceType', isLessThanOrEqualTo: '${input.query}\uf8ff')
      .get();

  final products = byTitle.docs.map((doc) => SearchResultEntity(
        id: doc.id,
        title: doc['title'],
        type: 'product',
      )).toList();

  final services = byServiceType.docs.map((doc) => SearchResultEntity(
        id: doc.id,
        title: doc['serviceType'],
        type: 'service',
      )).toList();

  return [...products, ...services];
}

}

