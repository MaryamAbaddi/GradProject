

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/profileavatar/data/avatar_datasrc/avatar_datasrcmeth.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';

class AvatarDatasrcimp  implements AvatarDatasrcmeth{
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  const AvatarDatasrcimp({
    required this.firestore
    ,required this.firebaseAuth});
  @override
  Future<AvatarEntity> getInit() async {
    final uid = firebaseAuth.currentUser!.uid;
    final doc = await firestore.collection('users').doc(uid).get();
     print('Doc exists: ${doc.exists}');
        print('Data: ${doc.data()}');
    final name = doc['UserName'] as String;
    final initial = name[0].toUpperCase();
    return AvatarEntity(initial: initial);
  }

  
}

/*class AvatarDatasrcimp  implements AvatarDatasrcmeth{
  @override
  Future<AvatarEntity> getInit() async {
    return AvatarEntity(initial: 'J');
  }
}*/