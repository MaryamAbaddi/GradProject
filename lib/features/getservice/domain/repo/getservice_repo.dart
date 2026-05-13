



import 'package:makanek/features/getservice/domain/entity/output_getsrvice.dart';

abstract class GetserviceRepo {
  Future<List<OutputGetservice>> getService();
}