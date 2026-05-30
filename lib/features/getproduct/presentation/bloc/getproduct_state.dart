import 'package:equatable/equatable.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';



abstract class GetproductState extends Equatable {
  const GetproductState();
  @override
  List<Object?> get props => [];
}

class GetproductInitial extends GetproductState {
  const GetproductInitial();
}

class GetproductLoading extends GetproductState {
  const GetproductLoading();
}

class GetproductSuccess extends GetproductState {
  final List<AddproductOutput> product;
  const GetproductSuccess({required this.product});
  @override
  List<Object?> get props => [product];
}

class GetproductError extends GetproductState {
  final String message;
  const GetproductError({required this.message});
  @override
  List<Object?> get props => [message];
}

class DeleteProductLoading extends GetproductState {
  const DeleteProductLoading();
}
class DeleteProductSuccess extends GetproductState {
  const DeleteProductSuccess();
}

class DeleteProductError extends GetproductState{
  final String message;
  const DeleteProductError({required this.message});
}