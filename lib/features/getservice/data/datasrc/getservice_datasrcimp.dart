



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/getservice/data/datasrc/getservice_datasrcmeth.dart';
import 'package:makanek/features/getservice/domain/entity/output_getsrvice.dart';

class GetserviceDatasrcimp  implements GetserviceDatasrcmeth{
 final FirebaseFirestore firestore;

  GetserviceDatasrcimp({required this.firestore});

 @override
  Future<List<OutputGetservice>> getService() async{
  final snapshot = await firestore.collection('General').orderBy('date', descending: true).get();
  return snapshot.docs.map((doc){
    final data = doc.data();
    final dt = (data['date'] as Timestamp).toDate();
    return OutputGetservice(phoneNumber: data['PhoneNumber'],
     price: data['price'], 
     date:'${dt.day}/${dt.month}/${dt.year}', 
     time: '${dt.hour}:${dt.minute.toString().padLeft(2, '0')}', 
    town:data['town'], type: 'service',);
  }).toList();
  }

  
}
