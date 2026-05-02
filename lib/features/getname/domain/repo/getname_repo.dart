


import 'package:makanek/features/getname/domain/entity/getname_entity.dart';

abstract class GetnameRepo {

  Future<GetnameEntity> getname();
}