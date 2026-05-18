



import 'package:equatable/equatable.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_output.dart';

class GetserviceState extends Equatable{

  const GetserviceState();
  @override 
  List<Object?> get props => [];
}


class InitGetService extends GetserviceState{}

class LoadingGetService extends GetserviceState{}

class ErrorGetService extends GetserviceState{
  final String message;
  const ErrorGetService({required this.message});
  @override 
  List<Object?> get props => [message];
}

class SuccessGetService extends GetserviceState{
  final List<AddserviceOutput> services;
  const SuccessGetService({required this.services});
  @override 
  List<Object?> get props => [services];
}