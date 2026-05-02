



import 'package:makanek/features/productpage1/domain/entity/product1_entity.dart';
import 'package:makanek/features/productpage1/domain/repo/product1_repo.dart';

class Product1Usecase {
  final Product1Repo repo; 
  Product1Usecase({required this.repo});

  List<Product1Entity> call()
  {
    return repo.product1Page();
  }

}