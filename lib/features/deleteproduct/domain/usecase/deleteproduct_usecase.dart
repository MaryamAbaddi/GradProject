



import 'package:makanek/features/deleteproduct/domain/repo/deleteproduct_repo.dart';

class DeleteProductUsecase {
  final DeleteProductRepo repo;

 DeleteProductUsecase({required this.repo});

    Future<void> calls(String productId)
    {
      return repo.deleteProduct(productId);
    }

  
}