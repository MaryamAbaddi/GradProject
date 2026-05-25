



import 'package:makanek/features/verificationpage/domain/entity/verifybyid_input.dart';
import 'package:makanek/features/verificationpage/domain/repo/verifybyid_repo.dart';

class VerifybyidUsecase {
  final VerifybyidRepo repo;
  VerifybyidUsecase({required this.repo});

  Future<void> calls(VerifybyidInput input) async {
    return await repo.verifyById(input);
  }

  
}