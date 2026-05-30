




import 'package:equatable/equatable.dart';

abstract class GetproductEvent extends Equatable {
  const GetproductEvent();
  @override
  List<Object?> get props => [];
}

class GetproductFetched extends GetproductEvent {
  const GetproductFetched();
}

class DeleteProductEvent extends GetproductEvent{
  final String productId;
  const DeleteProductEvent({required this.productId});
}

class FilterProduct extends GetproductEvent {
  final String? filter;
  final String? currentUserId;

  const FilterProduct({this.filter, this.currentUserId});

  @override
  List<Object?> get props => [filter, currentUserId];
}