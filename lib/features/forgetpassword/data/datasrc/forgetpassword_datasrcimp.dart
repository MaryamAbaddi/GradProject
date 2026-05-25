

import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/forgetpassword/data/datasrc/forgetpassword_datasrcmeth.dart';
import 'package:makanek/features/forgetpassword/domain/entity/forgetpassword_input.dart';

class ForgetpasswordDatasrcimp implements ForgetpasswordDatasrcmeth {
  @override
  Future<void> forgetPass(ForgetpasswordInput input) {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: input.email);
  }
}