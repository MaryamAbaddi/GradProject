import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
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

  getIt.registerFactory<GetserviceBloc>(
    () => GetserviceBloc(usecase: getIt<GetserviceUsecase>()),
  );
}