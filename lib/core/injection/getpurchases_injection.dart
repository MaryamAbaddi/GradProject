



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/getpurchases/data/datasrcimp/getpurchases_datasrcimp.dart';
import 'package:makanek/features/getpurchases/data/datasrcimp/getpurchases_datasrcmeth.dart';
import 'package:makanek/features/getpurchases/data/repoimp/getpurchases_repoimp.dart';
import 'package:makanek/features/getpurchases/domain/repo/getpurchases_repo.dart';
import 'package:makanek/features/getpurchases/domain/usecase/getpurchases_usecase.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_bloc.dart';

void initGetpurchasesInjection() {
  getIt.registerLazySingleton<GetpurchasesDatasrcmeth>(
    () => GetpurchasesDatasrcimp(firebase: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<GetpurchasesRepo>(
    () => GetpurchasesRepoimp(
      datasrc: getIt<GetpurchasesDatasrcmeth>(),
    ),
  );

  getIt.registerLazySingleton<GetpurchasesUsecase>(
    () => GetpurchasesUsecase(repo: getIt<GetpurchasesRepo>()),
  );


  getIt.registerFactory<GetpurchasesBloc>(
    () =>GetpurchasesBloc(
      usecase: getIt<GetpurchasesUsecase>(),
    ),
  );
}