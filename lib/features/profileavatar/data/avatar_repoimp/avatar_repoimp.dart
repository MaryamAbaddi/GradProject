



import 'package:makanek/features/profileavatar/data/avatar_datasrc/avatar_datasrcmeth.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/domain/repo/avatar_repo.dart';

 class AvatarRepoimp  implements AvatarRepo{
   final AvatarDatasrcmeth datasrc;
  const AvatarRepoimp({required this.datasrc});

  @override 
  Future<AvatarEntity> getInit() async
  {
    return datasrc.getInit();
  }
} 