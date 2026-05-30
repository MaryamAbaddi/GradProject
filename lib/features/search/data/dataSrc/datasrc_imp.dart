


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/search/data/dataSrc/datasrc_meth.dart';
import 'package:makanek/features/search/domain/entities/search_inentity.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';

class DatasrcImp implements DatasrcMeth{

  final FirebaseFirestore firestore;
  DatasrcImp({required this.firestore});

@override
Future<List<SearchResultEntity>> search(SearchInentity input) async {
  final query = input.query.toLowerCase();

  final byTitle = await firestore
      .collection('General')
      .where('TitleLower', isGreaterThanOrEqualTo: query)
      .where('TitleLower', isLessThanOrEqualTo: '$query\uf8ff')
      .get();

  final byServiceType = await firestore
      .collection('General')
      .where('serviceTypeLower', isGreaterThanOrEqualTo: query)
      .where('serviceTypeLower', isLessThanOrEqualTo: '$query\uf8ff')
      .get();

  final all = {...byTitle.docs, ...byServiceType.docs};

  return all.map((doc) {
    final type = doc['type'] as String;
    final title = type == 'product' ? doc['Title'] : doc['serviceType'];
    return SearchResultEntity(
      id: doc.id,
      title: title,
      type: type,
    );
  }).toList();
}
}

