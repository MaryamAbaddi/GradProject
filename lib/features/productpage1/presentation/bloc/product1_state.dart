



import 'package:makanek/features/productpage1/domain/entity/product1_entity.dart';

abstract class Product1State {}

class Product1Initial extends Product1State {}

class Product1Loaded extends Product1State {
  final List<Product1Entity> products;
  Product1Loaded({required this.products});
}