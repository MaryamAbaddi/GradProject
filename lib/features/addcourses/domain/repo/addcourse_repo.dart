



import 'package:makanek/features/addcourses/domain/entity/addcourse_input.dart';

abstract class AddcourseRepo {
  Future<void> addCourse(AddcourseInput input);
}