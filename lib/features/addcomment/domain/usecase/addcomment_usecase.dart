






import 'package:makanek/features/addcomment/domain/entity/addcomment_input.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';
import 'package:makanek/features/addcomment/domain/repo/addcomment_repo.dart';

class AddcommentUsecase {
  final AddCommentRepo repo; 
  const AddcommentUsecase({required this.repo});

  Future<CommentOutput> calls(AddcommentInput input ) async
  {
    return repo.addComment(input);
  }
}