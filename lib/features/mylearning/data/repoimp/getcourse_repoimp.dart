


import 'package:makanek/features/mylearning/data/datasrc/getcourse_datasrcmeth.dart';
import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';
import 'package:makanek/features/mylearning/domain/repo/getcourse_repo.dart';

class GetcourseRepoimp implements GetcourseRepo 
{
  final GetcourseDatasrcmeth datasrc;
  GetcourseRepoimp({required this.datasrc});
  
  @override
  Future<List<GetcoursesOutput>> getCourse() {
    return datasrc.getCourse();
  }
} 