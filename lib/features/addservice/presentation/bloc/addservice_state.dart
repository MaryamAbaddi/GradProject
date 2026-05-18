


import 'package:equatable/equatable.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

abstract class AddserviceState extends Equatable {
  const AddserviceState();

  @override
  List<Object?> get props => [];
}

class AddserviceInitial extends AddserviceState {}

class AddserviceLoading extends AddserviceState {}

class AddserviceSuccess extends AddserviceState {
  final AddserviceOutput service;
  const AddserviceSuccess({required this.service});

  @override
  List<Object?> get props => [service];
  
}

class AddserviceError extends AddserviceState {
  final String message;
  const AddserviceError({required this.message});

  @override
  List<Object?> get props => [message];
}