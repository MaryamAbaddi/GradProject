

part of 'category_bloc.dart';

abstract class CategoryState extends Equatable
{
  const CategoryState();
  @override
  List<Object?> get props => [];
}

class InitCategory extends CategoryState{
  const InitCategory();
}

class SuccessCategory extends CategoryState{

  final List<CategoryEntity> categoryEntity;
  const SuccessCategory(
    this.categoryEntity
  );
  @override
  List<Object?> get props =>[categoryEntity];
}

class ErrorCategory extends CategoryState{
  final String message;
  const ErrorCategory(this.message);
  @override
  List<Object?> get props =>[message];

}
class LoadingCategory extends CategoryState{
  const LoadingCategory();
}
