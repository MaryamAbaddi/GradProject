


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/deleteservice/data/datasrc/deleteservice_datasrcmeth.dart';

class DeleteserviceDatasrcimp implements DeleteserviceDatasrcmeth {

  
  @override
  Future<void> deletService(String serviceId) async {
     return  await  FirebaseFirestore.instance.collection('General').doc(serviceId).delete();
  }
  
}