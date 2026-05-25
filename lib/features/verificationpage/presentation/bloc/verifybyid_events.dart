





import 'dart:io';

import 'package:equatable/equatable.dart';

class VerifybyidEvents extends Equatable {
  const VerifybyidEvents();
  @override
  List<Object?> get props => [];
}

class VerfiybyIdSubmitted extends VerifybyidEvents{

  final String uid;
  final File imageUrl;

 const  VerfiybyIdSubmitted({required this.uid, required this.imageUrl});

  @override
  List<Object?> get props => [uid,imageUrl];
}