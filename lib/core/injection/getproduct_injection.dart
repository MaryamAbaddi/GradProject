




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/getproduct/data/datasrc/getproduct_datasrcimp.dart';
import 'package:makanek/features/getproduct/data/datasrc/getproduct_datasrcmeth.dart';
import 'package:makanek/features/getproduct/data/repoimp/getproduct_repoimp.dart';
import 'package:makanek/features/getproduct/domain/repo/getproduct_repo.dart';
import 'package:makanek/features/getproduct/domain/usecase/getproduct_usecase.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_bloc.dart';

void initGetProductInjection() {
  getIt.registerLazySingleton<GetProductDatasrcmeth>(
    () => GetproductDatasrcimp(firestore: FirebaseFirestore.instance),
  );

 

  getIt.registerLazySingleton<GetproductRepo>(
    () => GetproductRepoimp(
      datasrc: getIt<GetProductDatasrcmeth>(),
    ),
  );

  getIt.registerLazySingleton<GetprodcutUsecase>(
    () => GetprodcutUsecase(repo: getIt<GetproductRepo>()),
  );


  getIt.registerFactory<GetproductBloc>(
    () => GetproductBloc(
      usecase: getIt<GetprodcutUsecase>(),
    ),
  );
}

