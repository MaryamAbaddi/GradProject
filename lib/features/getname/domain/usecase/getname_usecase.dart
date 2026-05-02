



import 'package:makanek/features/getname/domain/entity/getname_entity.dart';
import 'package:makanek/features/getname/domain/repo/getname_repo.dart';

class GetnameUsecase {
  final GetnameRepo repo;

  const GetnameUsecase({required this.repo});

  Future<GetnameEntity> call() async {
    return await repo.getname();
  }
}
