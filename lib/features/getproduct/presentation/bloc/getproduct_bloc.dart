import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getproduct/domain/usecase/getproduct_usecase.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_state.dart';



class GetproductBloc extends Bloc<GetproductEvent, GetproductState> {
  final GetprodcutUsecase usecase;

  GetproductBloc({required this.usecase}) : super(const GetproductInitial()) {
    on<GetproductFetched>((event, emit) async {
  emit(const GetproductLoading());
  try {
    final product = await usecase.call();
    emit(GetproductSuccess(product: product));
  } catch (e) {
    emit(GetproductError(message: e.toString()));
  }
});
  }
}