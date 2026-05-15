







import 'package:makanek/features/addproduct/domain/entity/addproduct_input.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';

abstract class AddProductRepo {
  Future<AddproductOutput> addProduct(AddproductInput input);
}