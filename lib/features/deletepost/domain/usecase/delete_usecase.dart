




import 'package:makanek/features/deletepost/domain/repo/delete_repo.dart';

class DeleteUsecase {
  final DeleteRepo repo;
  const DeleteUsecase ({required this.repo});

  Future<void> call(String postId) async{
    return repo.deletepost(postId);
  }
}