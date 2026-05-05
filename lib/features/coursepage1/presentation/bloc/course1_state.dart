import 'package:makanek/features/coursepage1/domain/entity/course1_entity.dart';

abstract class Course1State {}

class Course1Initial extends Course1State {}

class Course1Loaded extends Course1State {
  final List<Course1Entity> courses;
  Course1Loaded({required this.courses});
}