



import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_output.dart';

abstract class AddtocartDatasrcmeth {
  Future<AddtocartOutput> addtocart(AddtocartInput input);
}