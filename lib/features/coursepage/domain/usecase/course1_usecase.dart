



import 'package:makanek/features/coursepage/domain/entity/course1_entity.dart';
import 'package:makanek/features/coursepage/domain/repo/course1_repo.dart';


class Course1Usecase {
  final Course1Repo repo; 
  Course1Usecase({required this.repo});

  List<Course1Entity> call()
  {
    return repo.course1Page();
  }

}