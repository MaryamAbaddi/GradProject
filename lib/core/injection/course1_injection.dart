import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/coursepage/data/repoimp/course1_repoimp.dart';
import 'package:makanek/features/coursepage/domain/repo/course1_repo.dart';
import 'package:makanek/features/coursepage/domain/usecase/course1_usecase.dart';
import 'package:makanek/features/coursepage/presentation/bloc/course1_bloc.dart';


void initCourse1Injection() {
  getIt.registerLazySingleton<Course1Repo>(
    () => Course1Repoimp(),
  );
  getIt.registerLazySingleton<Course1Usecase>(
    () => Course1Usecase(repo: getIt<Course1Repo>()),
  );
  getIt.registerFactory<Course1Bloc>(
    () => Course1Bloc(usecase: getIt<Course1Usecase>()),
  ); 
}