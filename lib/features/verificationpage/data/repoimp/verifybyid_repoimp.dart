




import 'package:makanek/features/verificationpage/data/datasrc/verifybyid_datasrcmeth.dart';
import 'package:makanek/features/verificationpage/domain/entity/verifybyid_input.dart';
import 'package:makanek/features/verificationpage/domain/repo/verifybyid_repo.dart';

class VerifybyidRepoimp implements VerifybyidRepo {
  final VerifybyidDatasrcmeth datasrc;

  VerifybyidRepoimp({required this.datasrc});
  @override
  Future<void> verifyById(VerifybyidInput input) {
    return datasrc.verifyById(input);
  }
  

}