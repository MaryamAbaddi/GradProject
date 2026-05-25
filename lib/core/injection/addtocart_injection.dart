

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addtocart/data/datasrc/addtocart_datasrcimp.dart';
import 'package:makanek/features/addtocart/data/datasrc/addtocart_datasrcmeth.dart';
import 'package:makanek/features/addtocart/data/repoimp/addtocart_repoimp.dart';
import 'package:makanek/features/addtocart/domain/repo/addtocart_repo.dart';
import 'package:makanek/features/addtocart/domain/usecase/addtocart_usecase.dart';
import 'package:makanek/features/addtocart/presentation/cubit/addtocart_cubit.dart';

void initAddtocartInjection() {
  getIt.registerLazySingleton<AddtocartDatasrcmeth>(
    () => AddtocartDatasrcimp(firebase: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<AddtocartRepo>(
    () => AddtocartRepoimp(datasrc: getIt<AddtocartDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AddtocartUsecase>(
    () => AddtocartUsecase(repo: getIt<AddtocartRepo>()),
  );

  getIt.registerFactory<AddtocartCubit>(
    () => AddtocartCubit(usecase: getIt<AddtocartUsecase>()),
  );
}