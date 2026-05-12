


import 'package:makanek/features/editprofilepage/domain/entity/editprofile_input.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_output.dart';

abstract class EditprofilePageRepo {

  Future<EditprofileOutput> editProfile(EditprofileInput input);
  Future<EditprofileOutput> getProfile();
}