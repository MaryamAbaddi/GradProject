



import 'package:makanek/features/addcomment/domain/entity/addcomment_input.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

abstract class AddcommentDatasrcmeth {
    Future<CommentOutput> addComment(AddcommentInput input );
}