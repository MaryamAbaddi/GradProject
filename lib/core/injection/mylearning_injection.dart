



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/deletepost/unenroll-course/data/datsrc/unenroll_datasrcimp.dart';
import 'package:makanek/features/deletepost/unenroll-course/data/datsrc/unenroll_datasrcmeth.dart';
import 'package:makanek/features/deletepost/unenroll-course/data/repoimp/unenroll_repoimp.dart';
import 'package:makanek/features/deletepost/unenroll-course/domain/repo/unenroll_repo.dart';
import 'package:makanek/features/deletepost/unenroll-course/domain/usecase/unenrollcourse_usecase.dart';
import 'package:makanek/features/mylearning/data/datasrc/getcourse_datasrcimp.dart';
import 'package:makanek/features/mylearning/data/repoimp/getcourse_repoimp.dart';
import 'package:makanek/features/mylearning/domain/usecase/getcourse_usecase.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_bloc.dart';

void initMyLearningInjection() {
  getIt.registerLazySingleton<GetcourseDatasrcimp>(
    () => GetcourseDatasrcimp(firestore: getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<GetcourseRepoimp>(
    () => GetcourseRepoimp(datasrc: getIt<GetcourseDatasrcimp>()),
  );

  getIt.registerLazySingleton<GetcourseUsecase>(
    () => GetcourseUsecase(repo: getIt<GetcourseRepoimp>()),
  );
  getIt.registerLazySingleton<UnenrollDatasrcmeth>(
  () => UnenrollDatasrcimp(firestore: FirebaseFirestore.instance),
);

getIt.registerLazySingleton<UnenrollRepo>(
  () => UnenrollRepoimp(datasrc: getIt<UnenrollDatasrcmeth>()),
);

getIt.registerLazySingleton<UnenrollUsecase>(
  () => UnenrollUsecase(repo: getIt<UnenrollRepo>()),
);

  getIt.registerFactory<GetcourseBloc>(
    () => GetcourseBloc(usecase: getIt<GetcourseUsecase>(), 
    deleteusecase: getIt<UnenrollUsecase>()),
  );
}