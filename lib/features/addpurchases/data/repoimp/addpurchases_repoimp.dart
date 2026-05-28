




import 'package:makanek/features/addpurchases/data/datasrc/addpurchases_datasrcmeth.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_input.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:makanek/features/addpurchases/domain/repo/addpurchases_repo.dart';

class AddpurchasesRepoimp implements AddpurchasesRepo {
  final AddpurchasesDatasrcmeth datasrc;

  AddpurchasesRepoimp({required this.datasrc});
  @override
  Future<Addpurchasesoutput> addPurchases(AddpurchasesInput input) {
      return datasrc.addPurchases(input);
  } 
}