



import 'package:makanek/features/deleteproduct/data/datasrc/deleteproduct_datasrcmeth.dart';
import 'package:makanek/features/deleteproduct/domain/repo/deleteproduct_repo.dart';


class DeleteProductRepoimp  implements DeleteProductRepo{
  final DeleteProductDatasrcmeth datasrc;

  DeleteProductRepoimp({required this.datasrc});
  
  @override
    Future<void> deleteProduct(String productId)
 {
    return datasrc.deleteProduct(productId);
  }
  
} 