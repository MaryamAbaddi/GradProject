import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/category/domain/Enitity/category_entity.dart';
import 'package:makanek/features/category/domain/usecase/category_usecase.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final CategoryUsecase getList;
  CategoryBloc({required this.getList}) : super(const InitCategory()) {

    on<OnInit>((event, emit) async {
      emit(const LoadingCategory());
      try {
        final result = getList();
        emit(SuccessCategory(result));
      } catch (e) {
        emit(ErrorCategory(e.toString()));
      }
    });
  }
}