




import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_output.dart';
import 'package:makanek/features/addtocart/domain/repo/addtocart_repo.dart';

class AddtocartUsecase {
  final AddtocartRepo repo;

  AddtocartUsecase({required this.repo});
  Future<AddtocartOutput> calls(AddtocartInput input)
  {
    return repo.addtocart(input);
  }
}