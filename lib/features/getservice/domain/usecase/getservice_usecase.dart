


import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/getservice/domain/repo/getservice_repo.dart';

class GetserviceUsecase {
  final GetserviceRepo repo;
  GetserviceUsecase({required this.repo});

  Future<List<AddserviceOutput>> call()
  {
    return repo.getService();
  }
}