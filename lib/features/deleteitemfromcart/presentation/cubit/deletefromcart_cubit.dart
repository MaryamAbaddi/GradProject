




import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/deleteitemfromcart/domain/entity/deletefromcart_input.dart';
import 'package:makanek/features/deleteitemfromcart/domain/usecase/deletefromcart_usecase.dart';

final class DeletefromcartCubit extends Cubit<void> {
    final DeletefromcartUsecase usecase;

   DeletefromcartCubit({required this.usecase}):super(null);

  Future<void> deleteFromCart(String docId) async{
    return usecase.calls(DeletefromcartInput(docId: docId));
  }
    
}