import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/servicepage1/data/repoimp/service1_repoimp.dart';
import 'package:makanek/features/servicepage1/domain/usecase/service1_usecase.dart';
import 'package:makanek/features/servicepage1/presentation/bloc/service1_bloc.dart';

void initService1Injection() {
  getIt.registerLazySingleton<Service1Repoimp>(
    () => Service1Repoimp(),
  );

  getIt.registerLazySingleton<Service1Usecase>(
    () => Service1Usecase(repo: getIt<Service1Repoimp>()),
  );

  getIt.registerFactory<Service1Bloc>(
  () => Service1Bloc(usecase: getIt<Service1Usecase>()),
);
}