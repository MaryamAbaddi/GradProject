import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/signup/data/signup_data_source/data_src_meth.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';

class AuthRemoteDataSrc implements DataSrcMeth {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSrc({required this.firebaseAuth, required this.firestore});

  @override
  Future<SignupOutEntity> signUp(SignUpEntity input) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: input.email,
        password: input.password,
      );

      final uid = credential.user!.uid;

      await firestore.collection('users').doc(uid).set({
        'uid': uid,
        'UserName': input.username,
        'Email': input.email,
        'Role': 'User',
        'createdAt': FieldValue.serverTimestamp(),
      });

      return SignupOutEntity(
        uid: uid,
        email: credential.user!.email ?? '',
      );
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message ?? 'Unknown error');
    }
  }
}