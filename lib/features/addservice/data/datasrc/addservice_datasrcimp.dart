import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/features/addservice/data/datasrc/addservice_datasrcmeth.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

class AddserviceDatasrcimp implements AddserviceDatasrcmeth {
  final FirebaseFirestore firestore;

  AddserviceDatasrcimp({required this.firestore});

  @override
  Future<AddserviceOutput> addService(AddserviceInput input) async {
    final doc = await firestore.collection('Services').add({
      'serviceType': input.serviceType,
      'phoneNumber': input.phoneNumber,
      'price': input.price,
      'createdAt': FieldValue.serverTimestamp(),
    });

    return AddserviceOutput(
      id: doc.id,
      serviceType: input.serviceType,
      phoneNumber: input.phoneNumber,
      price: input.price,
    );
  }
}