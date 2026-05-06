




import 'package:makanek/features/editpost/data/datasrc/edit_datasrcmeth.dart';
import 'package:makanek/features/editpost/domain/repo/edit_repo.dart';


class EditRepoimp implements EditRepo{
  final EditDatasrcmeth datasrc;
  const EditRepoimp({required this.datasrc});
  @override
  Future<void> editpost(String postId,String newBody) {
    return datasrc.editpost(postId,newBody);
  }
  

}