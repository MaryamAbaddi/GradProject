



import 'package:makanek/features/addpurchases/domain/entity/addpurchases_input.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';

abstract class AddpurchasesRepo {
  Future<Addpurchasesoutput> addPurchases(AddpurchasesInput input);
}