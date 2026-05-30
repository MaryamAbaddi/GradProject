


import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/domain/repo/avatar_repo.dart';

class AvatarUsecase {
  final AvatarRepo repo;
  const AvatarUsecase({required this.repo});
  
  Future<AvatarEntity> call({String? ownerId}) async {
    return await repo.getInit(ownerId: ownerId);
  }
}