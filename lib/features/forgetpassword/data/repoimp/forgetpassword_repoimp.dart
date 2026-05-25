



import 'package:makanek/features/forgetpassword/data/datasrc/forgetpassword_datasrcmeth.dart';
import 'package:makanek/features/forgetpassword/domain/entity/forgetpassword_input.dart';
import 'package:makanek/features/forgetpassword/domain/repo/forgetpassword_repo.dart';

class ForgetpasswordRepoimp  implements ForgetpasswordRepo{
  final ForgetpasswordDatasrcmeth datasrc;

  ForgetpasswordRepoimp({required this.datasrc});
  @override
  Future<void> forgetPass(ForgetpasswordInput input) {
      return datasrc.forgetPass(input);    
  }
  
}
