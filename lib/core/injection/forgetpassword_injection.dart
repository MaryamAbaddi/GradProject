



import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/forgetpassword/data/datasrc/forgetpassword_datasrcimp.dart';
import 'package:makanek/features/forgetpassword/data/datasrc/forgetpassword_datasrcmeth.dart';
import 'package:makanek/features/forgetpassword/data/repoimp/forgetpassword_repoimp.dart';
import 'package:makanek/features/forgetpassword/domain/repo/forgetpassword_repo.dart';
import 'package:makanek/features/forgetpassword/domain/usecase/forgetpassword_usecase.dart';
import 'package:makanek/features/forgetpassword/presentation/cubit/forgetpassword_cubit.dart';

void initForgetpasswordInjection() {
  getIt.registerLazySingleton<ForgetpasswordDatasrcmeth>(
    () => ForgetpasswordDatasrcimp(),
  );

  getIt.registerLazySingleton<ForgetpasswordRepo>(
    () => ForgetpasswordRepoimp(datasrc: getIt<ForgetpasswordDatasrcmeth>()),
  );

  getIt.registerLazySingleton<ForgetpasswordUsecase>(
    () => ForgetpasswordUsecase(repo: getIt<ForgetpasswordRepo>()),
  );

  getIt.registerFactory<ForgetpasswordCubit>(
    () => ForgetpasswordCubit(usecase: getIt<ForgetpasswordUsecase>()),
  );
}