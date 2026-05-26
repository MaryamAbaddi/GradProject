



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/addcourses/data/datasrc/addcourse_datasrcmeth.dart';
import 'package:makanek/features/addcourses/domain/entity/addcourse_input.dart';

class AddcourseDatasrcimp implements AddcourseDatasrcmeth {
  
  final FirebaseFirestore firestore;


  AddcourseDatasrcimp({required this.firestore});

  @override
  Future<void> addCourse(AddcourseInput input) async {
      final uid = FirebaseAuth.instance.currentUser!.uid;
    await firestore.collection('users').doc(uid)
    .collection('courses').doc(input.title).set({
      'title': input.title,
      'imagePath':input.imagePath

  });
  }
  
  
}