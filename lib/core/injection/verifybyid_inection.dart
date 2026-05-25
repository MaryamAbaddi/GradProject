




import 'package:firebase_storage/firebase_storage.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/verificationpage/data/datasrc/verifybyid_datasrcimp.dart';
import 'package:makanek/features/verificationpage/data/datasrc/verifybyid_datasrcmeth.dart';
import 'package:makanek/features/verificationpage/data/repoimp/verifybyid_repoimp.dart';
import 'package:makanek/features/verificationpage/domain/repo/verifybyid_repo.dart';
import 'package:makanek/features/verificationpage/domain/usecase/verifybyid_usecase.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_bloc.dart';

void initVerifybyidInjection() {
  getIt.registerLazySingleton<VerifybyidDatasrcmeth>(
    () => VerifybyidDatasrcimp(storage: FirebaseStorage.instance),
  );

  getIt.registerLazySingleton<VerifybyidRepo>(
    () => VerifybyidRepoimp(datasrc: getIt<VerifybyidDatasrcmeth>()),
  );

  getIt.registerLazySingleton<VerifybyidUsecase>(
    () => VerifybyidUsecase(repo: getIt<VerifybyidRepo>()),
  );

  getIt.registerFactory<VerifybyidBloc>(
    () => VerifybyidBloc(usecase: getIt<VerifybyidUsecase>()),
  );
}