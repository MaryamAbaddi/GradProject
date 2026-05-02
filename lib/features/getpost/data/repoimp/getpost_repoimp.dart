







import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/getpost/data/datasrc/getpost_datasrcmeth.dart';
import 'package:makanek/features/getpost/domain/repo/getpost_repo.dart';

class GetpostRepoimp  implements GetpostRepo{
  final GetpostDatasrcmeth datasrc;
  const GetpostRepoimp({required this.datasrc});

  @override
  Future<List<OutputEntity>> getPost() async{
    return  await datasrc.getPost();
  }
  

}