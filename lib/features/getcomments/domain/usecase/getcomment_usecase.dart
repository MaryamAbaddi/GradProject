


import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';
import 'package:makanek/features/getcomments/domain/repo/getcomments_repo.dart';

class GetcommentUsecase {
  final GetcommentsRepo repo;

  GetcommentUsecase({required this.repo}); 
  Future<List<CommentOutput>> calls(String postId) async
  {
   return await repo.getcomment(postId);
  }
}