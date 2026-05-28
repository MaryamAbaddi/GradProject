



import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:makanek/features/getpurchases/domain/repo/getpurchases_repo.dart';

class GetpurchasesUsecase {
  final GetpurchasesRepo repo;
  GetpurchasesUsecase({required this.repo}); 

  Future<List<Addpurchasesoutput>> calls() async
  {
     return await repo.getPurchases();
  }
}