


import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/features/category/domain/Entity/category_entity.dart';
import 'package:makanek/features/category/domain/repository/category_repo.dart';

class CategoryRepoImp implements CategoryRepo  {

    @override
    List<CategoryEntity> getCategories()
    {
      return const [
        CategoryEntity(imagePath: 'assets/images/services.png', title: 'Services', route: AppRoutes.service),
        CategoryEntity(imagePath: 'assets/images/courses.png', title: 'Courses', route: AppRoutes.courses1),
        CategoryEntity(imagePath: 'assets/images/products.png', title: 'Products', route:AppRoutes.product)
      ];
    }
  
}