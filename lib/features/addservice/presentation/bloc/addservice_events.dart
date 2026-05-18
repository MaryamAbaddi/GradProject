



import 'package:equatable/equatable.dart';

abstract class AddserviceEvent extends Equatable {
  const AddserviceEvent();

  @override
  List<Object?> get props => [];
}

class AddserviceSubmitted extends AddserviceEvent {
  final String serviceType;
  final String phoneNumber;
  final double price;

  const AddserviceSubmitted({
    required this.serviceType,
    required this.phoneNumber,
    required this.price,
  });

  @override
  List<Object?> get props => [serviceType, phoneNumber, price];
}