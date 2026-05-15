






import 'package:makanek/features/addproduct/data/datasrc/addproduct_datasrcmeth.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_input.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';
import 'package:makanek/features/addproduct/domain/repo/addproduct_repo.dart';

class AddProductRepoimp implements AddProductRepo {
  final AddproductDatasrcmeth datasrc;

  AddProductRepoimp({required this.datasrc});
  
  @override
  Future<AddproductOutput> addProduct(AddproductInput input) {
   return datasrc.addProduct(input);
  }
  
  


}