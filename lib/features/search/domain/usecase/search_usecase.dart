



import 'package:makanek/features/search/domain/entities/search_inentity.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';
import 'package:makanek/features/search/domain/repo/search_repo.dart';

class SearchUsecase {
  final SearchRepo repo;
  const  SearchUsecase({required this.repo});

  Future<List<SearchResultEntity>> call(SearchInentity input)
  async {
    return await repo.search(input);
  }
}