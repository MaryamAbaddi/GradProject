



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_input.dart';
import 'package:makanek/features/addproduct/domain/usecase/addproduct_usecase.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_events.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_state.dart';



class AddproductBloc extends Bloc<AddproductEvent, AddproductState> {
  final AddProductUsecase usecase;

  bool _isProcessing = false;

  AddproductBloc({required this.usecase}) : super(const AddproductInitial()) {
    on<AddproductSubmitted>((event, emit) async {
      if (_isProcessing) return;

      _isProcessing = true;

      emit(const AddproductLoading());

      try {
        final input = AddproductInput(
          body: event.body,
          imagePath: event.imageUrl,
          title: event.title, price: event.price,
          productType: event.productType,
        );

        final result = await usecase.calls(input);

        emit(AddproductSuccess(product: result));
      } catch (e) {
        emit(AddproductError(message: e.toString()));
      }

      _isProcessing = false;
    });
  }
}