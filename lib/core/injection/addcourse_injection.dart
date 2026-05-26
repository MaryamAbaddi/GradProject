


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addcourses/data/datasrc/addcourse_datasrcimp.dart';
import 'package:makanek/features/addcourses/data/repoimp/addcourse_repoimp.dart';
import 'package:makanek/features/addcourses/domain/usecase/addcourse_usecase.dart';
import 'package:makanek/features/addcourses/presentation/cubit/addcourse_cubit.dart';

void initAddCourseInjection() {
  getIt.registerLazySingleton<AddcourseDatasrcimp>(
    () => AddcourseDatasrcimp(firestore: getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<AddcourseRepoimp>(
    () => AddcourseRepoimp(datasrc: getIt<AddcourseDatasrcimp>()),
  );

  getIt.registerLazySingleton<AddcourseUsecase>(
    () => AddcourseUsecase(repo: getIt<AddcourseRepoimp>()),
  );

  getIt.registerFactory<AddCourseCubit>(
    () => AddCourseCubit(usecase: getIt<AddcourseUsecase>()),
  );
}