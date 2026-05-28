



import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

abstract class GetcommentsRepo {
  Future<List<CommentOutput>> getcomment(String postId);
}