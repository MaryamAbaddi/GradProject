import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/login/data/remote_data_souce_meth.dart';
import 'package:makanek/features/login/domain/entities.dart';



class RemoteDataSourceImp implements RemoteDataSouceMeth {

  final FirebaseAuth firebaseAuth;

  RemoteDataSourceImp({required this.firebaseAuth});

  @override
Future<LoginOutputEntity> login(LoginInputEntity input) async {
  try {                                           
    final credential = await firebaseAuth.signInWithEmailAndPassword(
      email: input.email,
      password: input.password,
    );
    return LoginOutputEntity(
      uid: credential.user!.uid,
      email: credential.user!.email ?? '',
    );
  } on FirebaseAuthException catch (e) {            
    throw Exception(e.message ?? 'Unknown error');
  }
}
}