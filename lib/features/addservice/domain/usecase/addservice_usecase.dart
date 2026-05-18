





import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/addservice/domain/repo/addservice_repo.dart';

class AddserviceUsecase {

final AddserviceRepo repo; 

const AddserviceUsecase({required this.repo});

  Future<AddserviceOutput> calls(AddserviceInput input)
  {
    return repo.addService(input);
  }
}