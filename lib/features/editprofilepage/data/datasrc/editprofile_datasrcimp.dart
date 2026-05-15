




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/editprofilepage/data/datasrc/editprofile_datameth.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_input.dart';
import 'package:makanek/features/editprofilepage/domain/entity/editprofile_output.dart';

class EditprofileDatasrcimp implements EditprofileDatameth{
    
  final FirebaseFirestore firestore;
  EditprofileDatasrcimp({required this.firestore});

  @override
  Future<EditprofileOutput> editProfile(EditprofileInput input) async {
    final result = FirebaseAuth.instance.currentUser!.uid;
    await firestore.collection('users').doc(result).update({
      'UserName' :input.name,
      'Email':input.email
    });
    final doc = await firestore.collection('users').doc(result).get();

    return EditprofileOutput(email:doc.data()!['Email'] , name:doc.data()!['UserName']);
  }
  @override
  Future<EditprofileOutput> getProfile() async
  {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final doc = await firestore.collection('users').doc(uid).get();
    return EditprofileOutput(
      email: doc.data()!['Email'],
       name: doc.data()!['UserName']);

  }
}