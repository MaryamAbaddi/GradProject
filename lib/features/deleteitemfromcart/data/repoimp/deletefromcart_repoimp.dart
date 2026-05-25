



import 'package:makanek/features/deleteitemfromcart/data/datasrc/deletefromcart_datasrcmeth.dart';
import 'package:makanek/features/deleteitemfromcart/domain/entity/deletefromcart_input.dart';
import 'package:makanek/features/deleteitemfromcart/domain/repo/deletefromcart_repo.dart';

class DeletefromcartRepoimp  implements DeletefromcartRepo{
  final DeletefromcartDatasrcmeth datasrc;

  DeletefromcartRepoimp({required this.datasrc});
  
  @override
  Future<void> deleteFromCart(DeletefromcartInput input) async {
    return await datasrc.deleteFromCart(input);
  }
  
}