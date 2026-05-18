






import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

abstract class AddserviceDatasrcmeth {
    Future<AddserviceOutput> addService(AddserviceInput input);
}