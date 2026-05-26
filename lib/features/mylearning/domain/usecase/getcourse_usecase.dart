



import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';
import 'package:makanek/features/mylearning/domain/repo/getcourse_repo.dart';

class GetcourseUsecase {
  final GetcourseRepo repo;
  GetcourseUsecase({required this.repo}); 

    Future<List<GetcoursesOutput>> calls()
    {
      return repo.getCourse();
    }
}