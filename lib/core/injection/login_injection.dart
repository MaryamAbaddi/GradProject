import 'package:firebase_auth/firebase_auth.dart';
import '../../features/login/data/login_repo_imp.dart';
import '../../features/login/data/remote_data_source_imp.dart';
import '../../features/login/domain/usecase.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';



void initLoginInjection() {

  getIt.registerLazySingleton<RemoteDataSourceImp>(
    () => RemoteDataSourceImp(firebaseAuth: getIt<FirebaseAuth>()),
  );

  getIt.registerLazySingleton<LoginRepoImp>(
    () => LoginRepoImp(remoteDataSource: getIt<RemoteDataSourceImp>()),
  );

  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(repo: getIt<LoginRepoImp>()),
  );

  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(loginUseCase: getIt<LoginUseCase>()),
  );
}