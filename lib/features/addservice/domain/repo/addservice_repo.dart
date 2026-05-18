



import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

abstract class AddserviceRepo  {

  Future<AddserviceOutput> addService(AddserviceInput input);

}