import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/usecase/addtocart_usecase.dart';

class AddtocartCubit  extends Cubit<void>{
  final AddtocartUsecase usecase;

  AddtocartCubit({required this.usecase}): super(null) ;

  Future<void> addtocart(String itemId) async {
    await usecase.calls(AddtocartInput(itemId: itemId));
  }
}