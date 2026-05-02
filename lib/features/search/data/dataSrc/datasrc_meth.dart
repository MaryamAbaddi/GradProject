import 'package:makanek/features/search/domain/entities/search_inentity.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';

abstract class DatasrcMeth {
    Future<List<SearchResultEntity>> search(SearchInentity input);
}