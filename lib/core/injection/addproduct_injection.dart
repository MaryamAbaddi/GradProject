import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addproduct/data/datasrc/addproduct_datasrcimp.dart';
import 'package:makanek/features/addproduct/data/datasrc/addproduct_datasrcmeth.dart';
import 'package:makanek/features/addproduct/data/repoimp/addproduct_repoimp.dart';
import 'package:makanek/features/addproduct/domain/repo/addproduct_repo.dart';
import 'package:makanek/features/addproduct/domain/usecase/addproduct_usecase.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_bloc.dart';

void initAddProductInjection() {
  getIt.registerLazySingleton<AddproductDatasrcmeth>(
    () => AddProductDatasrcimp(
      firestore: FirebaseFirestore.instance,
      storage: FirebaseStorage.instance,
    ),
  );

  getIt.registerLazySingleton<AddProductRepo>(
    () => AddProductRepoimp(datasrc: getIt<AddproductDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AddProductUsecase>(
    () => AddProductUsecase(repo: getIt<AddProductRepo>()),
  );

  getIt.registerFactory<AddproductBloc>(
    () => AddproductBloc(usecase: getIt<AddProductUsecase>()),
  );
}