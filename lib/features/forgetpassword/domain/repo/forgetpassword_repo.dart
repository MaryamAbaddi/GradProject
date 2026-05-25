




import 'package:makanek/features/forgetpassword/domain/entity/forgetpassword_input.dart';

abstract class ForgetpasswordRepo {
  Future<void> forgetPass(ForgetpasswordInput input);
}