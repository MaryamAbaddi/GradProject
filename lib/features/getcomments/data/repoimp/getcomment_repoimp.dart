



import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';
import 'package:makanek/features/getcomments/data/datasrc/getcomment_datasrcmeth.dart';
import 'package:makanek/features/getcomments/domain/repo/getcomments_repo.dart';

class GetcommentRepoimp implements GetcommentsRepo {
  final GetcommentDatasrcmeth datasrc;

  GetcommentRepoimp({required this.datasrc});
  @override
  Future<List<CommentOutput>> getcomment(String postId) {
    return datasrc.getcomment(postId);
  }


  
} 