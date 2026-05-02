import 'package:makanek/features/servicepage1/domain/entity/service1_entity.dart';

abstract class Service1State {}

class Service1Initial extends Service1State {}

class Service1Loaded extends Service1State {
  final List<Service1Entity> services;
  Service1Loaded({required this.services});
}