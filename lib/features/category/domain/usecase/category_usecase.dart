




import 'package:makanek/features/category/domain/Enitity/category_entity.dart';
import 'package:makanek/features/category/domain/repository/category_repo.dart';

class CategoryUsecase  {

  final CategoryRepo repo;
  const CategoryUsecase ({required this.repo});
   List<CategoryEntity> call()
  {
    return repo.getCategories();
  }

}