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
    final docRef = firestore.collection('General').doc();
    await docRef.set({
      'type':'service',
      'serviceType': input.serviceType,
      'phoneNumber': input.phoneNumber,
      'priceService': input.priceService,
      'serviceId': docRef.id,
      'OwnerId': uid,
    });

    return AddserviceOutput(
      id: docRef.id,
      serviceType: input.serviceType,
      phoneNumber: input.phoneNumber,
      price: input.priceService,
      ownerId: uid,

    );
  }
}