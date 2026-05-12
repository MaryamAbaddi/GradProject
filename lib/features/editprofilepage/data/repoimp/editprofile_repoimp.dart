



import 'package:makanek/features/editprofilepage/data/datasrc/editprofile_datasrcimp.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_input.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_output.dart';
import 'package:makanek/features/editprofilepage/domain/repo/editprofile_repo.dart';

class EditprofileRepoimp implements   EditprofilePageRepo {

  final EditprofileDatasrcimp datasrc;
  const EditprofileRepoimp({required this.datasrc});

  @override
  Future<EditprofileOutput> editProfile(EditprofileInput input){
    return datasrc.editProfile(input);
   }
   
    @override
    Future<EditprofileOutput> getProfile() {
    return datasrc.getProfile();
    }
}