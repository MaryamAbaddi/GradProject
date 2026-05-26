
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<void> signInWithGoogle() async {
  await GoogleSignIn.instance.initialize(
  serverClientId: '579004116235-kjlh9dda2vhk5mfq99tholm0gete2ki9.apps.googleusercontent.com',
);
  final googleUser = await GoogleSignIn.instance.authenticate();
  final credential = GoogleAuthProvider.credential(
    idToken: googleUser.authentication.idToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}