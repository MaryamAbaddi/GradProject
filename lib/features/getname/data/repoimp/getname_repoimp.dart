



import 'package:makanek/features/getname/data/datasrc/getname_datasrcmeth.dart';
import 'package:makanek/features/getname/domain/entity/getname_entity.dart';
import 'package:makanek/features/getname/domain/repo/getname_repo.dart';

class GetnameRepoimp implements GetnameRepo {
  final GetnameDatasrcmeth datasrc;
  const GetnameRepoimp ({ required this.datasrc});

  @override
  Future<GetnameEntity> getname() {
   return datasrc.getname();
  }
}