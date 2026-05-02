



import 'package:makanek/features/category/domain/Entity/category_entity.dart';

abstract class CategoryRepo {
  List<CategoryEntity> getCategories();
}