





import 'package:firebase_storage/firebase_storage.dart';
import 'package:makanek/features/verificationpage/data/datasrc/verifybyid_datasrcmeth.dart';
import 'package:makanek/features/verificationpage/domain/entity/verifybyid_input.dart';

class VerifybyidDatasrcimp implements VerifybyidDatasrcmeth {
  final FirebaseStorage storage;

  VerifybyidDatasrcimp({required this.storage});

 @override
    Future<void> verifyById(VerifybyidInput input) async {
      final ref = storage
          .ref()
          .child('verifications')
          .child('${input.uid}.jpg');

      await ref.putFile(input.imageUrl);
    }
    } 