import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/profileavatar/data/avatar_datasrc/avatar_datasrcimp.dart';
import 'package:makanek/features/profileavatar/data/avatar_datasrc/avatar_datasrcmeth.dart';
import 'package:makanek/features/profileavatar/data/avatar_repoimp/avatar_repoimp.dart';
import 'package:makanek/features/profileavatar/domain/repo/avatar_repo.dart';
import 'package:makanek/features/profileavatar/domain/usecase/avatar_usecase.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';


void initAvatarInjection() {
  getIt.registerLazySingleton<AvatarDatasrcmeth>(
  () => AvatarDatasrcimp(
    firestore: getIt<FirebaseFirestore>(),
    firebaseAuth: getIt<FirebaseAuth>(),
  ),
);

  getIt.registerLazySingleton<AvatarRepo>(
    () => AvatarRepoimp(datasrc: getIt<AvatarDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AvatarUsecase>(
    () => AvatarUsecase(repo: getIt<AvatarRepo>()),
  );

  getIt.registerFactory<AvatarCubit>(
    () => AvatarCubit(usecase: getIt<AvatarUsecase>()),
  );
}