




import 'package:makanek/features/forgetpassword/domain/entity/forgetpassword_input.dart';
import 'package:makanek/features/forgetpassword/domain/repo/forgetpassword_repo.dart';

class ForgetpasswordUsecase {
  final ForgetpasswordRepo repo;
  ForgetpasswordUsecase({required this.repo}); 

  Future<void> calls(ForgetpasswordInput input)
  async {
     return repo.forgetPass(input);
  }
  
}