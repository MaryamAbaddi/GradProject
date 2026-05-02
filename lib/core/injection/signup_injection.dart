import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makanek/features/signup/data/signup_data_source/data_src_meth.dart';
import '../../features/signup/data/signup_data_source/data_src_imp.dart';
import '../../features/signup/data/signup_repo_imp.dart';
import '../../features/signup/domain/signup_usecase/signup_usecase.dart';
import '../../features/signup/presentation/bloc/signup_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';


void initSignupInjection() {
  getIt.registerLazySingleton<DataSrcMeth>(
  () => AuthRemoteDataSrc(
    firebaseAuth: getIt<FirebaseAuth>(),
    firestore: getIt<FirebaseFirestore>(),
  ),
);
 getIt.registerLazySingleton<SignupRepoImp>(
  () => SignupRepoImp(dataSrc: getIt<DataSrcMeth>()),
);

  getIt.registerLazySingleton<SignupUsecase>(
    () => SignupUsecase(repo: getIt<SignupRepoImp>()),
  );

  getIt.registerFactory<SignUpBloc>(
    () => SignUpBloc(signupUsecase: getIt<SignupUsecase>()),
  );
}