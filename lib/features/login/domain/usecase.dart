import 'package:makanek/features/login/domain/entities.dart';
import 'package:makanek/features/login/domain/repository.dart';

class LoginUseCase{

  final LoginRepo repo;
  const LoginUseCase({
  required this.repo
  });

  Future<LoginOutputEntity> call(LoginInputEntity input){

    return repo.getLoginConfirm(input);
  }

}