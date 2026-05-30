



import 'package:makanek/features/deletepost/unenroll-course/domain/repo/unenroll_repo.dart';

class UnenrollUsecase{
  final UnenrollRepo repo;
  UnenrollUsecase({required this.repo});
    Future<void> calls(String title)
    {
       return repo.unenrollCourse(title);
   }
  
}