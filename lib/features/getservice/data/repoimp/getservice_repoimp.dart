


import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/getservice/data/datasrc/getservice_datasrcmeth.dart';
import 'package:makanek/features/getservice/domain/repo/getservice_repo.dart';

class GetserviceRepoimp  implements GetserviceRepo{
  final GetserviceDatasrcmeth datasrc;
  GetserviceRepoimp({required this.datasrc});

  
  @override
  Future<List<AddserviceOutput>> getService() async {
    return datasrc.getService();
  }
}