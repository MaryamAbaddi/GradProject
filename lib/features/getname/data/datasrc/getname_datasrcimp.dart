



//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:makanek/features/getname/data/datasrc/getname_datasrcmeth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/getname/data/datasrc/getname_datasrcmeth.dart';
import 'package:makanek/features/getname/domain/entity/getname_entity.dart';

class GetnameDatasrcimp implements GetnameDatasrcmeth {
  
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  const GetnameDatasrcimp({
    required this.firebaseAuth,
    required this.firestore});
  @override 
  Future<GetnameEntity> getname() async {
    final uid = firebaseAuth.currentUser!.uid;
    print('Creating Firestore doc for UID: $uid');
    final doc = await firestore.collection('users').doc(uid).get();
    return GetnameEntity(name: doc['UserName']);
  }
}


/*class GetnameDatasrcimp implements GetnameDatasrcmeth{

  
  @override
  Future<GetnameEntity> getname() async {
    return  GetnameEntity(name: 'Joud!');
  }

}*/