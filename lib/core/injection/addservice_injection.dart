



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addservice/data/datasrc/addservice_datasrcimp.dart';
import 'package:makanek/features/addservice/data/datasrc/addservice_datasrcmeth.dart';
import 'package:makanek/features/addservice/data/repoimp/addservice_repoimp.dart';
import 'package:makanek/features/addservice/domain/repo/addservice_repo.dart';
import 'package:makanek/features/addservice/domain/usecase/addservice_usecase.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_bloc.dart';

void initAddServiceInjection() {
  getIt.registerLazySingleton<AddserviceDatasrcmeth>(
    () => AddserviceDatasrcimp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<AddserviceRepo>(
    () => AddserviceRepoimp(datasrc: getIt<AddserviceDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AddserviceUsecase>(
    () => AddserviceUsecase(repo: getIt<AddserviceRepo>()),
  );

  getIt.registerFactory<AddserviceBloc>(
    () => AddserviceBloc(usecase: getIt<AddserviceUsecase>()),
  );
}