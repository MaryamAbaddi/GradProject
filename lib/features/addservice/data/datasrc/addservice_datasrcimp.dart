import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/addservice/data/datasrc/addservice_datasrcmeth.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

class AddserviceDatasrcimp implements AddserviceDatasrcmeth {
  final FirebaseFirestore firestore;
    final uid = FirebaseAuth.instance.currentUser!.uid;

  AddserviceDatasrcimp({required this.firestore});

  @override
  Future<AddserviceOutput> addService(AddserviceInput input) async {
    final doc = await firestore.collection('General').add({
      'serviceType': input.serviceType,
      'phoneNumber': input.phoneNumber,
      'price': input.price,
      'OwnerId':uid,
     });

    return AddserviceOutput(
      id: doc.id,
      serviceType: input.serviceType,
      phoneNumber: input.phoneNumber,
      price: input.price,
    );
  }
}