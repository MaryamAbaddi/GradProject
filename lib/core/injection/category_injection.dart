import '../../features/category/data/category_repo_imp.dart';
import '../../features/category/domain/usecase/category_usecase.dart';
import '../../features/category/presentation/bloc/category_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';


void initCategoryInjection() {
  // 1. Repository
  getIt.registerLazySingleton<CategoryRepoImp>(
    () => CategoryRepoImp(),
  );

  // 2. Use Case
  getIt.registerLazySingleton<CategoryUsecase>(
    () => CategoryUsecase(repo: getIt<CategoryRepoImp>()),
  );

  // 3. Bloc
  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(getList: getIt<CategoryUsecase>()),
  );
}