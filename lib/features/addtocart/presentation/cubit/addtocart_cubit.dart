import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/usecase/addtocart_usecase.dart';

class AddtocartCubit {
  final AddtocartUsecase usecase;

  AddtocartCubit({required this.usecase});

  Future<void> addtocart(String itemId) async {
    await usecase.calls(AddtocartInput(itemId: itemId));
  }
}