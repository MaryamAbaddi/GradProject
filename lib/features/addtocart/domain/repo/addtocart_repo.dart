



import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_output.dart';

abstract class AddtocartRepo {
    Future<AddtocartOutput> addtocart(AddtocartInput input);
}
