





import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';
import 'package:makanek/features/getproduct/domain/repo/getproduct_repo.dart';

class GetprodcutUsecase {
  final GetproductRepo repo;

  const GetprodcutUsecase({required this.repo});

  Future<List<AddproductOutput>> call() async {
    return await repo.getProduct();
  }
}