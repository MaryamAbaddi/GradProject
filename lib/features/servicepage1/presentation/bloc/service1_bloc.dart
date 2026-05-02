import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/servicepage1/domain/usecase/service1_usecase.dart';
import 'package:makanek/features/servicepage1/presentation/bloc/service1_events.dart';
import 'package:makanek/features/servicepage1/presentation/bloc/service1_state.dart';

class Service1Bloc extends Bloc<Service1Event, Service1State> {
  final Service1Usecase usecase;

  Service1Bloc({required this.usecase}) : super(Service1Initial()) {
    on<LoadService1Event>((event, emit) {
      emit(Service1Loaded(services: usecase.call()));
    });
  }
}