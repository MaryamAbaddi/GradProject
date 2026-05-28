




import 'package:equatable/equatable.dart';

abstract class AddproductEvent extends Equatable {
  const AddproductEvent();
  @override
  List<Object?> get props => [];
}

class AddproductSubmitted extends AddproductEvent {
  final String imageUrl;
  final String body;
  final String title;
  final double price;
  final String productType;
  const AddproductSubmitted({required this.imageUrl, required this.body, required this.title, required this.price, required this.productType});
  @override
  List<Object?> get props => [imageUrl, body,title,price,productType];
}