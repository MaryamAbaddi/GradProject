


import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';

abstract class GetpurchasesRepo {
  Future<List<Addpurchasesoutput>> getPurchases();
}