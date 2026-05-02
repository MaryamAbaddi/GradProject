// features/search/injection/search_injection.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:makanek/features/search/data/dataSrc/datasrc_imp.dart';
import 'package:makanek/features/search/data/dataSrc/datasrc_meth.dart';
import 'package:makanek/features/search/data/repo_imp.dart';
import 'package:makanek/features/search/domain/repo/search_repo.dart';
import 'package:makanek/features/search/domain/usecase/search_usecase.dart';
import 'package:makanek/features/search/presentation/bloc/search_bloc.dart';

final getIt = GetIt.instance;

void setupSearchInjection() {
  // DataSource
  getIt.registerLazySingleton<DatasrcMeth>(
    () => DatasrcImp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImp(dataSrc: getIt<DatasrcMeth>()),
  );

  getIt.registerLazySingleton(
    () => SearchUsecase(repo: getIt<SearchRepo>()),
  );

  getIt.registerFactory(
    () => SearchBloc(searchUsecase: getIt<SearchUsecase>()),
  );
}