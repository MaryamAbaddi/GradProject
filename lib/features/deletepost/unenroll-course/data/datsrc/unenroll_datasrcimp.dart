



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/deletepost/unenroll-course/data/datsrc/unenroll_datasrcmeth.dart';

class UnenrollDatasrcimp  implements UnenrollDatasrcmeth{
   final FirebaseFirestore firestore;
   final uid = FirebaseAuth.instance.currentUser!.uid;
  UnenrollDatasrcimp({required this.firestore});
  
  @override
  Future<void> unenrollCourse(String title) async{
      return await firestore.collection('users').doc(uid).collection('courses').doc(title).delete();  }
   

}