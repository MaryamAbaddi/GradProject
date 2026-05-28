


import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

abstract class GetcommentDatasrcmeth {
    Future<List<CommentOutput>> getcomment(String postId);
}