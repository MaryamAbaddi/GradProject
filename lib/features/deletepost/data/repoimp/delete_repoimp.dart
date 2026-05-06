




import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/deletepost/data/datasrc/delete_datasrcmeth.dart';
import 'package:makanek/features/deletepost/domain/repo/delete_repo.dart';

class DeleteRepoimp  implements DeleteRepo{
    final DeleteDatasrcmeth datasrc;
    const DeleteRepoimp({required this.datasrc});

  @override
  Future<void> deletepost(String postId) {
    return datasrc.deletepost(postId);
  }



}