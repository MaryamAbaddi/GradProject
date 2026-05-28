


import 'package:makanek/features/addpurchases/domain/entity/addpurchases_input.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';

abstract class AddpurchasesDatasrcmeth {
    Future<Addpurchasesoutput> addPurchases(AddpurchasesInput input);
}