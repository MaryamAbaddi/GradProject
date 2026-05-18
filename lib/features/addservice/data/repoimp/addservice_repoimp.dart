



import 'package:makanek/features/addservice/data/datasrc/addservice_datasrcmeth.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/addservice/domain/repo/addservice_repo.dart';

class AddserviceRepoimp implements AddserviceRepo {
  final AddserviceDatasrcmeth datasrc;

  AddserviceRepoimp({required this.datasrc});

  @override
  Future<AddserviceOutput> addService(AddserviceInput input) {
    return datasrc.addService(input);
  }

  

}