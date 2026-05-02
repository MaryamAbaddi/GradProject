


import 'package:makanek/features/search/data/dataSrc/datasrc_meth.dart';
import 'package:makanek/features/search/domain/entities/search_inentity.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';
import 'package:makanek/features/search/domain/repo/search_repo.dart';

class SearchRepoImp implements SearchRepo {
  final DatasrcMeth dataSrc; 

  SearchRepoImp({required this.dataSrc});

  @override
  Future<List<SearchResultEntity>> search(SearchInentity input) async {
    return await dataSrc.search(input); 
  }
}