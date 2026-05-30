



import 'package:makanek/features/deletepost/unenroll-course/data/datsrc/unenroll_datasrcmeth.dart';
import 'package:makanek/features/deletepost/unenroll-course/domain/repo/unenroll_repo.dart';

class UnenrollRepoimp  implements UnenrollRepo{
  final UnenrollDatasrcmeth datasrc;

  UnenrollRepoimp({required this.datasrc});
  
  @override
  Future<void> unenrollCourse(String title) {
      return datasrc.unenrollCourse(title);
  }
}