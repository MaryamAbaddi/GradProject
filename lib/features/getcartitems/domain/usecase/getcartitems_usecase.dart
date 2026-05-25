





import 'package:makanek/features/getcartitems/domain/entity/getcartitems_output.dart';
import 'package:makanek/features/getcartitems/domain/repo/getcartitems_repo.dart';

class GetcartitemsUsecase {
  final GetcartitemsRepo repo;
  GetcartitemsUsecase({required this.repo}); 

  Future<List<GetCartOutput>> calls(){
    return repo.getcartItems();
  }
}