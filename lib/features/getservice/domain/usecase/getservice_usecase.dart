


import 'package:makanek/features/getservice/domain/entity/output_getsrvice.dart';
import 'package:makanek/features/getservice/domain/repo/getservice_repo.dart';

class GetserviceUsecase {
  final GetserviceRepo repo;
  GetserviceUsecase({required this.repo});

  Future<List<OutputGetservice>> call()
  {
    return repo.getService();
  }
}