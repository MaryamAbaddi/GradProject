import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';
import 'package:makanek/features/signup/domain/signup_repository/signup_repo.dart';

class SignupUsecase {
  
  final SignupRepo repo;
  SignupUsecase ({required this.repo});

  Future<SignupOutEntity> call(SignUpEntity input)
  {
    return repo.signUp(input);
  }
}
