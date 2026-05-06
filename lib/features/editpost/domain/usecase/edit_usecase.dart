




import 'package:makanek/features/editpost/domain/repo/edit_repo.dart';

class EditUsecase {
  final EditRepo repo; 
  const EditUsecase({required this.repo});

  Future<void> call(String postId,String newBody)
  {
    return repo.editpost(postId,newBody);
  }

}