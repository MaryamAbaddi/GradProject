import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/deletepost/data/datasrc/delete_datasrcimp.dart';
import 'package:makanek/features/deletepost/data/datasrc/delete_datasrcmeth.dart';
import 'package:makanek/features/deletepost/data/repoimp/delete_repoimp.dart';
import 'package:makanek/features/deletepost/domain/repo/delete_repo.dart';
import 'package:makanek/features/deletepost/domain/usecase/delete_usecase.dart';
import 'package:makanek/features/getpost/data/datasrc/getpost_datasrcimp.dart';
import 'package:makanek/features/getpost/data/datasrc/getpost_datasrcmeth.dart';
import 'package:makanek/features/getpost/data/repoimp/getpost_repoimp.dart';
import 'package:makanek/features/getpost/domain/repo/getpost_repo.dart';
import 'package:makanek/features/getpost/domain/usecase/getpost_usecase.dart';
import 'package:makanek/features/getpost/presentation/bloc/getpost_bloc.dart';

void initGetPostInjection() {
  // getpost dependencies
  getIt.registerLazySingleton<GetpostDatasrcmeth>(
    () => GetpostDatasrcimp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<GetpostRepo>(
    () => GetpostRepoimp(datasrc: getIt<GetpostDatasrcmeth>()),
  );

  getIt.registerLazySingleton<GetpostUsecase>(
    () => GetpostUsecase(repo: getIt<GetpostRepo>()),
  );

  // delete dependencies
  getIt.registerLazySingleton<DeleteRepo>(
    () => DeleteRepoimp(datasrc: getIt<DeleteDatasrcmeth>()),
  );

  getIt.registerLazySingleton<DeleteDatasrcmeth>(
    () => DeleteDatasrcimp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<DeleteUsecase>(
    () => DeleteUsecase(repo: getIt<DeleteRepo>()),
  );

  getIt.registerFactory<GetpostBloc>(
    () => GetpostBloc(
      usecase: getIt<GetpostUsecase>(),
      deleteUsecase: getIt<DeleteUsecase>(), 
    ),
  );
}