


import 'package:makanek/features/addproduct/domain/entity/addproduct_input.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';
import 'package:makanek/features/addproduct/domain/repo/addproduct_repo.dart';

class AddProductUsecase {
  final AddProductRepo repo; 

  const AddProductUsecase ({required this.repo});

    Future<AddproductOutput> calls(AddproductInput input) async
    {
      return await repo.addProduct(input);
    }

}