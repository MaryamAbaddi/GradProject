



import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

abstract class GetserviceRepo {
  Future<List<AddserviceOutput>> getService();
}