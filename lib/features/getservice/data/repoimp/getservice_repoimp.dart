


import 'package:makanek/features/getservice/data/datasrc/getservice_datasrcmeth.dart';
import 'package:makanek/features/getservice/domain/entity/output_getsrvice.dart';
import 'package:makanek/features/getservice/domain/repo/getservice_repo.dart';

class GetserviceRepoimp  implements GetserviceRepo{
  final GetserviceDatasrcmeth datasrc;
  GetserviceRepoimp({required this.datasrc});

  
  @override
  Future<List<OutputGetservice>> getService() async {
    return datasrc.getService();
  }
}