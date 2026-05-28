



import 'package:makanek/features/addpurchases/domain/entity/addpurchases_input.dart';
import 'package:makanek/features/addpurchases/domain/entity/addpurchases_output.dart';
import 'package:makanek/features/addpurchases/domain/repo/addpurchases_repo.dart';

class AddpurchasesUsecase {
  final AddpurchasesRepo repo;
  AddpurchasesUsecase({required this.repo});

Future<Addpurchasesoutput> calls(AddpurchasesInput input)
{
  return repo.addPurchases(input);
}

  
}