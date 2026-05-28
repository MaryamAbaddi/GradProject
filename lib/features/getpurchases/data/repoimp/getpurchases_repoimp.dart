


import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:makanek/features/getpurchases/data/datasrcimp/getpurchases_datasrcmeth.dart';
import 'package:makanek/features/getpurchases/domain/repo/getpurchases_repo.dart';

class GetpurchasesRepoimp  implements GetpurchasesRepo{
  final GetpurchasesDatasrcmeth datasrc;

  GetpurchasesRepoimp({required this.datasrc});
  
  @override
  Future<List<Addpurchasesoutput>> getPurchases() {
   return datasrc.getPurchases();
  }

  
}