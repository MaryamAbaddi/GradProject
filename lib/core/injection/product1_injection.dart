import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/productpage1/data/product1_repoimp.dart';
import 'package:makanek/features/productpage1/domain/repo/product1_repo.dart';
import 'package:makanek/features/productpage1/domain/usecase/product1_usecase.dart';
import 'package:makanek/features/productpage1/presentation/bloc/product1_bloc.dart';

void initProduct1Injection() {
  getIt.registerLazySingleton<Product1Repo>(
    () => Product1Repoimp(),
  );
  getIt.registerLazySingleton<Product1Usecase>(
    () => Product1Usecase(repo: getIt<Product1Repo>()),
  );
  getIt.registerFactory<Product1Bloc>(
    () => Product1Bloc(usecase: getIt<Product1Usecase>()),
  ); 
}