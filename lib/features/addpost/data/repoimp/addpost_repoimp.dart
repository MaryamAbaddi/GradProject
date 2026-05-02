



import 'package:makanek/features/addpost/data/datasrc/addpost_datasrcmeth.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/addpost/domain/repo/addpost_repo.dart';

class AddpostRepoimp  implements AddpostRepo{
  final AddpostDatasrcmeth datasrc;
  const AddpostRepoimp ({required this.datasrc});
  
  @override
  Future<OutputEntity> addpost(InputEntity input) async {
    return  await datasrc.addPost(input);
  }

}