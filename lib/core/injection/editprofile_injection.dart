import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/editprofilepage/data/datasrc/editprofile_datasrcimp.dart';
import 'package:makanek/features/editprofilepage/data/repoimp/editprofile_repoimp.dart';
import 'package:makanek/features/editprofilepage/domain/repo/editprofile_repo.dart';
import 'package:makanek/features/editprofilepage/domain/usecase/editprofile_usecase.dart';
import 'package:makanek/features/editprofilepage/presentation/bloc/editpage_bloc.dart';


  void initEditProfileinjection() {
    getIt.registerLazySingleton<EditprofileDatasrcimp>(
      () => EditprofileDatasrcimp(firestore: getIt<FirebaseFirestore>()),
    );

    getIt.registerLazySingleton<EditprofileRepoimp>(
      () => EditprofileRepoimp(datasrc: getIt<EditprofileDatasrcimp>()),
    );

    getIt.registerLazySingleton<EditprofilePageRepo>(
      () => getIt<EditprofileRepoimp>(),
    );

    getIt.registerLazySingleton<EditprofileUsecase>(
      () => EditprofileUsecase(repo: getIt<EditprofilePageRepo>()),
    );

    getIt.registerLazySingleton<GetProfileUsecase>(
  () => GetProfileUsecase(repo: getIt<EditprofilePageRepo>()),
    );
    
    getIt.registerFactory<EditProfilePageBloc>(
      () => EditProfilePageBloc( usecase: getIt<EditprofileUsecase>(), usecaseGet: getIt<GetProfileUsecase>()),
    );
  }
