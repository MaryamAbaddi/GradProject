
import 'package:equatable/equatable.dart';
import 'package:makanek/features/addproduct/domain/entity/addproduct_output.dart';

abstract class AddproductState extends Equatable {
  const AddproductState();
  @override
  List<Object?> get props => [];
}

class AddproductInitial extends AddproductState {
  const AddproductInitial();
}

class AddproductLoading extends AddproductState {
  const AddproductLoading();
}

class AddproductSuccess extends AddproductState {
  final AddproductOutput product;
  const AddproductSuccess({required this.product});
  @override
  List<Object?> get props => [product];
}

class AddproductError extends AddproductState {
  final String message;
  const AddproductError({required this.message});
  @override
  List<Object?> get props => [message];
}