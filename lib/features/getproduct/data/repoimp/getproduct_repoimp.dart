




import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';
import 'package:makanek/features/getproduct/data/datasrc/getproduct_datasrcmeth.dart';
import 'package:makanek/features/getproduct/domain/repo/getproduct_repo.dart';

class GetproductRepoimp implements GetproductRepo {
  final GetProductDatasrcmeth datasrc;

     GetproductRepoimp({
    required this.datasrc,
  });

  @override
  Future<List<AddproductOutput>> getProduct() async {
    return datasrc.getProduct();
  }
}