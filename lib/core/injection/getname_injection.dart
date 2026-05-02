
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/getname/data/datasrc/getname_datasrcimp.dart';
import 'package:makanek/features/getname/data/datasrc/getname_datasrcmeth.dart';
import 'package:makanek/features/getname/data/repoimp/getname_repoimp.dart';
import 'package:makanek/features/getname/domain/repo/getname_repo.dart';
import 'package:makanek/features/getname/domain/usecase/getname_usecase.dart';
import 'package:makanek/features/getname/presentation/bloc/getname_bloc.dart';

 void initGetnameInjection() {
  getIt.registerLazySingleton<GetnameDatasrcmeth>(
    () => GetnameDatasrcimp(
      firebaseAuth: getIt<FirebaseAuth>(),
      firestore: getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerLazySingleton<GetnameRepo>(
    () => GetnameRepoimp(datasrc: getIt<GetnameDatasrcmeth>()),
  );

  getIt.registerLazySingleton<GetnameUsecase>(
    () => GetnameUsecase(repo: getIt<GetnameRepo>()),
  );

  getIt.registerFactory<GetnameBloc>(
    () => GetnameBloc(usecase: getIt<GetnameUsecase>()),
  );
}
