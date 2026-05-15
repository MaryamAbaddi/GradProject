



import 'package:makanek/features/addcomment/data/datasrc/addcomment_datasrcmeth.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_input.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';
import 'package:makanek/features/addcomment/domain/repo/addcomment_repo.dart';

class AddcommentRepoimp implements AddCommentRepo {
  final AddcommentDatasrcmeth datasrc;

  AddcommentRepoimp({required this.datasrc});
  @override
  Future<CommentOutput> addComment(AddcommentInput input) {
	return datasrc.addComment(input);
  }

	

}