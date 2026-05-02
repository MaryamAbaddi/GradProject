import 'package:makanek/features/signup/data/signup_data_source/data_src_meth.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';
import 'package:makanek/features/signup/domain/signup_repository/signup_repo.dart';

class SignupRepoImp implements SignupRepo {
  final DataSrcMeth dataSrc; 

  SignupRepoImp({required this.dataSrc});

  @override
  Future<SignupOutEntity> signUp(SignUpEntity input) async {
    return await dataSrc.signUp(input); 
  }
}