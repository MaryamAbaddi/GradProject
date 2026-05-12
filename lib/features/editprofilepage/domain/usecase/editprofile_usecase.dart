



import 'package:makanek/features/editprofilepage/domain/entity/editprofile_input.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_output.dart';
import 'package:makanek/features/editprofilepage/domain/repo/editprofile_repo.dart';

class EditprofileUsecase {
  final EditprofilePageRepo repo;
  EditprofileUsecase ({required this.repo});

  Future<EditprofileOutput> call(EditprofileInput input){
    return repo.editProfile(input);
  }
}
class GetProfileUsecase{

  final EditprofilePageRepo repo;
  GetProfileUsecase ({required this.repo});
  Future<EditprofileOutput> call()
  {
    return repo.getProfile();
  }

}