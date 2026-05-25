



import 'package:makanek/features/getcartitems/data/datasrc/getcartitems_datasrcmeth.dart';
import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';
import 'package:makanek/features/getcartitems/domain/repo/getcartitems_repo.dart';

class GetcartitemsRepoimp implements GetcartitemsRepo {
  final GetcartitemsDatasrcmeth datasrc;

  GetcartitemsRepoimp({required this.datasrc});
  @override
  Future<List<GetCartOutput>> getcartItems() {
    return datasrc.getcartItems();
    
  }
  
}