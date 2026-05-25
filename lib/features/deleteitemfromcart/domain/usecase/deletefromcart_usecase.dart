




import 'package:makanek/features/deleteitemfromcart/domain/entity/deletefromcart_input.dart';
import 'package:makanek/features/deleteitemfromcart/domain/repo/deletefromcart_repo.dart';

class DeletefromcartUsecase {
  final DeletefromcartRepo repo;
  DeletefromcartUsecase({required this.repo});

  Future<void> calls(DeletefromcartInput input)
  {
    return repo.deleteFromCart(input);
  }
}