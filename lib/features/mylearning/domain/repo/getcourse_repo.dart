




import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';

abstract class GetcourseRepo {
  Future<List<GetcoursesOutput>> getCourse();
}