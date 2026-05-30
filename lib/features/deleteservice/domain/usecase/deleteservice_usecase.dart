


import 'package:makanek/features/deleteservice/domain/repo/deleteservice_repo.dart';

class DeleteserviceUsecase {
  final DeleteserviceRepo repo;

  DeleteserviceUsecase({required this.repo});

    Future<void> calls(String serviceId)
    {
      return repo.deletService(serviceId);
    }

  
}