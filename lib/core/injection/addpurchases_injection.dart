


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addpurchases/data/datasrc/addpurchases_datasrcimp.dart';
import 'package:makanek/features/addpurchases/data/repoimp/addpurchases_repoimp.dart';
import 'package:makanek/features/addpurchases/domain/usecase/addpurchases_usecase.dart';
import 'package:makanek/features/addpurchases/presentation/cubit/addpurchases_cubit.dart';

void initAddPurchasesInjection() {
  getIt.registerLazySingleton<AddpurchasesDatasrcimp>(
    () => AddpurchasesDatasrcimp(firestore: getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<AddpurchasesRepoimp>(
    () => AddpurchasesRepoimp(datasrc: getIt<AddpurchasesDatasrcimp>()),
  );

  getIt.registerLazySingleton<AddpurchasesUsecase>(
    () => AddpurchasesUsecase(repo: getIt<AddpurchasesRepoimp>()),
  );

  getIt.registerFactory<AddPurchasesCubit>(
    () => AddPurchasesCubit(usecase: getIt<AddpurchasesUsecase>()),
  );
}