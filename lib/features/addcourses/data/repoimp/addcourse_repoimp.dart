

import 'package:makanek/features/addcourses/data/datasrc/addcourse_datasrcmeth.dart';
import 'package:makanek/features/addcourses/domain/entity/addcourse_input.dart';
import 'package:makanek/features/addcourses/domain/repo/addcourse_repo.dart';

class AddcourseRepoimp implements AddcourseRepo {

  final AddcourseDatasrcmeth datasrc;

  AddcourseRepoimp({required this.datasrc});
  @override
  Future<void> addCourse(AddcourseInput input) {
    return datasrc.addCourse(input);
     }
  
  
  
}