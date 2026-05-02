



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/productpage1/domain/usecase/product1_usecase.dart';
import 'package:makanek/features/productpage1/presentation/bloc/product1_events.dart';
import 'package:makanek/features/productpage1/presentation/bloc/product1_state.dart';

class Product1Bloc extends Bloc<Product1Events, Product1State> {
  final Product1Usecase usecase;

  Product1Bloc({required this.usecase}) : super(Product1Initial()) {
    on<LoadProduct1Event>((event, emit) {
      emit(Product1Loaded(products: usecase.call()));
    });
  }
}