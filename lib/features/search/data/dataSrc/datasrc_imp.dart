


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
        .collection('posts')           
        .where('title', isGreaterThanOrEqualTo: input.query)
        .where('title', isLessThanOrEqualTo: '${input.query}\uf8ff')
        .get();

      final byBody = await firestore
        .collection('posts')
        .where('body', isGreaterThanOrEqualTo: input.query)
        .where('body', isLessThanOrEqualTo: '${input.query}\uf8ff')
        .get();
        final all = {...byTitle.docs, ...byBody.docs};

    return all.map((doc) => SearchResultEntity(
      id: doc.id,
      title: doc['title'],
      body: doc['body'],
    )).toList();
  } 

}

