



import 'package:makanek/features/deleteitemfromcart/domain/entity/deletefromcart_input.dart';

abstract class DeletefromcartRepo {
  Future<void>  deleteFromCart(DeletefromcartInput input);  
}