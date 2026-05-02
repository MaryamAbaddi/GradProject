import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addpost/data/datasrc/addpost_datasrcmeth.dart';
import 'package:makanek/features/addpost/data/datasrc/addpost_datasrcimp.dart';
import 'package:makanek/features/addpost/data/repoimp/addpost_repoimp.dart';
import 'package:makanek/features/addpost/domain/repo/addpost_repo.dart';
import 'package:makanek/features/addpost/domain/usecase/addpost_usecase.dart';
import 'package:makanek/features/addpost/presentation/bloc/addpost_bloc.dart';

/*void initAddPostInjection() {
  getIt.registerLazySingleton<AddpostDatasrcmeth>(
    () => AddpostDatasrcimp(dio: Dio()),
  );

  getIt.registerLazySingleton<AddpostRepo>(
    () => AddpostRepoimp(datasrc: getIt<AddpostDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AddpostUsecase>(
    () => AddpostUsecase(repo: getIt<AddpostRepo>()),
  );

  getIt.registerFactory<AddpostBloc>(
    () => AddpostBloc(usecase: getIt<AddpostUsecase>()),
  );
}*/



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


void initAddPostInjection() {
  getIt.registerLazySingleton<AddpostDatasrcmeth>(
    () => AddpostDatasrcimp(
      firestore: FirebaseFirestore.instance,
      storage: FirebaseStorage.instance,
    ),
  );

  getIt.registerLazySingleton<AddpostRepo>(
    () => AddpostRepoimp(datasrc: getIt<AddpostDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AddpostUsecase>(
    () => AddpostUsecase(repo: getIt<AddpostRepo>()),
  );

  getIt.registerFactory<AddpostBloc>(
    () => AddpostBloc(usecase: getIt<AddpostUsecase>()),
  );
}