


import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';

abstract class AvatarRepo {
    Future<AvatarEntity> getInit();
}