





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/mylearning/data/datasrc/getcourse_datasrcmeth.dart';
import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';

class GetcourseDatasrcimp implements GetcourseDatasrcmeth
{
  final FirebaseFirestore firestore;
  
  GetcourseDatasrcimp({required this.firestore}); 
  
  @override
  Future<List<GetcoursesOutput>> getCourse() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final snapchot = await firestore.collection('users').doc(uid).collection('courses').get();

    return snapchot.docs.map((doc) => GetcoursesOutput(title: doc['title'], imagePath: doc['imagePath'])).toList();
  }

}
  
  
