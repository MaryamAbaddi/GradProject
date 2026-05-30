import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/deleteproduct/domain/usecase/deleteproduct_usecase.dart';
import 'package:makanek/features/getproduct/domain/usecase/getproduct_usecase.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_state.dart';



class GetproductBloc extends Bloc<GetproductEvent, GetproductState> {
  final GetprodcutUsecase usecase;
  final DeleteProductUsecase deleteusecase;

  GetproductBloc({required this.usecase, required this.deleteusecase}) : super(const GetproductInitial()) {
  on<GetproductFetched>((event, emit) async {
  emit(const GetproductLoading());
  try {
      final product = await usecase.call();
      emit(GetproductSuccess(product: product));
    } catch (e) {
      emit(GetproductError(message: e.toString()));
    }
  });
  on<FilterProduct>((event, emit) async {
  emit(const GetproductLoading());
  try {
    final products = await usecase.call();
    final filtered = event.filter == null
        ? products
        : event.filter == 'My posts'
            ? products.where((p) => p.ownerId == event.currentUserId).toList()
            : products.where((p) => p.productType.toLowerCase() == event.filter!.toLowerCase()).toList();
        emit(GetproductSuccess(product: filtered));
  }catch(e){
    emit(GetproductError(message: e.toString()));
  }
  });
     on<DeleteProductEvent>((event,emit) async{
      emit(const DeleteProductLoading());
        try{
        await deleteusecase.calls(event.productId);
        emit(DeleteProductSuccess());
        add(GetproductFetched());
        } catch(e){
           print('❌ Delete error: $e');
          emit(DeleteProductError(message: 'An error occured!')); 
        }
    });
  }
}