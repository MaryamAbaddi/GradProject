



import 'package:makanek/features/addcourses/domain/entity/addcourse_input.dart';
import 'package:makanek/features/addcourses/domain/repo/addcourse_repo.dart';

class AddcourseUsecase {
  final AddcourseRepo repo;

  AddcourseUsecase({required this.repo}); 

    Future<void> calls(AddcourseInput input)
    {
      return repo.addCourse(input);
    }
}