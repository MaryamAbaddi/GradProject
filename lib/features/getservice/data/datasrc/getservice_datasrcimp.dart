



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';
import 'package:makanek/features/getservice/data/datasrc/getservice_datasrcmeth.dart';

class GetserviceDatasrcimp  implements GetserviceDatasrcmeth{
 final FirebaseFirestore firestore;

  GetserviceDatasrcimp({required this.firestore});

 @override
  Future<List<AddserviceOutput>> getService() async{
  final snapshot = await firestore.collection('General').where('type', isEqualTo: 'service').get();
  return snapshot.docs.map((doc){
    final data = doc.data();
    return AddserviceOutput(
    phoneNumber: data['phoneNumber'] as String? ?? '',
    price: (data['priceService'] as num?)?.toDouble() ?? 0.0,
    serviceType: data['serviceType'] as String? ?? '', 
    ownerId: data['OwnerId'] as String? ?? '',
    id: doc.id,);
  }).toList();
  }

  
}
