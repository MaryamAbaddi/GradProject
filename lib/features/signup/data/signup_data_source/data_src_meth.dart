



import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';

abstract class DataSrcMeth {
  
  Future<SignupOutEntity> signUp(SignUpEntity input);
}