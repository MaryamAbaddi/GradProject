import '../../features/category/data/category_repo_imp.dart';
import '../../features/category/domain/usecase/category_usecase.dart';
import '../../features/category/presentation/bloc/category_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';


void initCategoryInjection() {
  getIt.registerLazySingleton<CategoryRepoImp>(
    () => CategoryRepoImp(),
  );

  getIt.registerLazySingleton<CategoryUsecase>(
    () => CategoryUsecase(repo: getIt<CategoryRepoImp>()),
  );

  getIt.registerFactory<CategoryBloc>(
    () => CategoryBloc(getList: getIt<CategoryUsecase>()),
  );
}