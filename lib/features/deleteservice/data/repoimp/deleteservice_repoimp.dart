



import 'package:makanek/features/deleteservice/data/datasrc/deleteservice_datasrcmeth.dart';
import 'package:makanek/features/deleteservice/domain/repo/deleteservice_repo.dart';

class DeleteserviceRepoimp  implements DeleteserviceRepo{
  final DeleteserviceDatasrcmeth datasrc;

  DeleteserviceRepoimp({required this.datasrc});
  
  @override
  Future<void> deletService(String serviceId) {
    return datasrc.deletService(serviceId);
  }
  
} 