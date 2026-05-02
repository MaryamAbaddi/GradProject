



import 'package:makanek/features/servicepage1/domain/entity/service1_entity.dart';
import 'package:makanek/features/servicepage1/domain/repo/service1_repo.dart';

class Service1Usecase {
  final Service1Repo repo; 
  Service1Usecase({required this.repo});

  List<Service1Entity> call()
  {
    return repo.service1Page();
  }

}