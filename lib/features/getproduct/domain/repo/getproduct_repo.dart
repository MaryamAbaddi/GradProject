 





 import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';

abstract class GetproductRepo {
  Future<List<AddproductOutput>> getProduct();
}