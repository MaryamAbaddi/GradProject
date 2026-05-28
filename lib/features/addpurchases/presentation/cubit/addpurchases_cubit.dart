import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_input.dart';
import 'package:makanek/features/addpurchases/domain/usecase/addpurchases_usecase.dart';

class AddPurchasesCubit extends Cubit<void> {
  final AddpurchasesUsecase usecase;

  AddPurchasesCubit({required this.usecase}) : super(null);

  Future<void> addPurchase(String title, double price, String? imageUrl) async {
    await usecase.calls(AddpurchasesInput(
      title: title,
      price: price,
      imageUrl: imageUrl,
    ));
  }
}