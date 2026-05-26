



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/search/data/dataSrc/datasrc_imp.dart';
import 'package:makanek/features/search/data/repo_imp.dart';
import 'package:makanek/features/search/domain/usecase/search_usecase.dart';
import 'package:makanek/features/search/presentation/bloc/search_bloc.dart';

void initSearchInjection() {
  getIt.registerLazySingleton<DatasrcImp>(
    () => DatasrcImp(firestore: getIt<FirebaseFirestore>()),
  );

  getIt.registerLazySingleton<SearchRepoImp>(
    () => SearchRepoImp(dataSrc: getIt<DatasrcImp>()),
  );

  getIt.registerLazySingleton<SearchUsecase>(
    () => SearchUsecase(repo: getIt<SearchRepoImp>()),
  );

  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(searchUsecase: getIt<SearchUsecase>()),
  );
}