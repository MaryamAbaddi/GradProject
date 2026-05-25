




import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';

abstract class GetcartitemsRepo {
  Future<List<GetCartOutput>> getcartItems();
}