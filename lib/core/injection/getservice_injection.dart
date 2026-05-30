import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/deleteservice/data/datasrc/deleteservice_datasrcimp.dart';
import 'package:makanek/features/deleteservice/data/datasrc/deleteservice_datasrcmeth.dart';
import 'package:makanek/features/deleteservice/data/repoimp/deleteservice_repoimp.dart';
import 'package:makanek/features/deleteservice/domain/repo/deleteservice_repo.dart';
import 'package:makanek/features/deleteservice/domain/usecase/deleteservice_usecase.dart';
import 'package:makanek/features/getservice/data/datasrc/getservice_datasrcimp.dart';
import 'package:makanek/features/getservice/data/datasrc/getservice_datasrcmeth.dart';
import 'package:makanek/features/getservice/data/repoimp/getservice_repoimp.dart';
import 'package:makanek/features/getservice/domain/repo/getservice_repo.dart';
import 'package:makanek/features/getservice/domain/usecase/getservice_usecase.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_bloc.dart';

void initGetServiceInjection() {
  getIt.registerLazySingleton<GetserviceDatasrcmeth>(
    () => GetserviceDatasrcimp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<GetserviceRepo>(
    () => GetserviceRepoimp(datasrc: getIt<GetserviceDatasrcmeth>()),
  );

  getIt.registerLazySingleton<GetserviceUsecase>(
    () => GetserviceUsecase(repo: getIt<GetserviceRepo>()),
  );
  
  getIt.registerLazySingleton<DeleteserviceDatasrcmeth>(
    () => DeleteserviceDatasrcimp(),
  );
  getIt.registerLazySingleton<DeleteserviceRepo>(
    () => DeleteserviceRepoimp(datasrc: getIt<DeleteserviceDatasrcmeth>()),
  );
  getIt.registerLazySingleton<DeleteserviceUsecase>(
    () => DeleteserviceUsecase(repo: getIt<DeleteserviceRepo>()),
  );

  getIt.registerFactory<GetserviceBloc>(
    () => GetserviceBloc(
      usecase: getIt<GetserviceUsecase>(), 
     deleteusecase:getIt<DeleteserviceUsecase>()),
  );
  
}