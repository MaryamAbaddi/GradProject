




import 'package:makanek/features/verificationpage/domain/entity/verifybyid_input.dart';

abstract class VerifybyidRepo {
  Future<void> verifyById(VerifybyidInput input);
}