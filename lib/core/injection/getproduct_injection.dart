




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/deleteproduct/data/datasrc/deleteproduct_datasrcimp.dart';
import 'package:makanek/features/deleteproduct/data/datasrc/deleteproduct_datasrcmeth.dart';
import 'package:makanek/features/deleteproduct/data/repoimp/deleteproduct_repoimp.dart';
import 'package:makanek/features/deleteproduct/domain/repo/deleteproduct_repo.dart';
import 'package:makanek/features/deleteproduct/domain/usecase/deleteproduct_usecase.dart';
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
   getIt.registerLazySingleton<DeleteProductDatasrcmeth>(
    () => DeleteProductDatasrcimp(),
  );
  getIt.registerLazySingleton<DeleteProductRepo>(
    () => DeleteProductRepoimp(datasrc: getIt<DeleteProductDatasrcmeth>()),
  );
  getIt.registerLazySingleton<DeleteProductUsecase>(
    () => DeleteProductUsecase(repo: getIt<DeleteProductRepo>()),
  );


  getIt.registerFactory<GetproductBloc>(
    () => GetproductBloc(  
      usecase: getIt<GetprodcutUsecase>(),
       deleteusecase: getIt<DeleteProductUsecase>(),
    ),
  );
}

