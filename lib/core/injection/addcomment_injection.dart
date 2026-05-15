



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addcomment/data/datasrc/addcomment_datasrcimp.dart';
import 'package:makanek/features/addcomment/data/datasrc/addcomment_datasrcmeth.dart';
import 'package:makanek/features/addcomment/data/repoimp/addcomment_repoimp.dart';
import 'package:makanek/features/addcomment/domain/repo/addcomment_repo.dart';
import 'package:makanek/features/addcomment/domain/usecase/addcomment_usecase.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_bloc.dart';

void initAddCommentInjection() {
  getIt.registerLazySingleton<AddcommentDatasrcmeth>(
    () => AddcommentDatasrcimp(
      firestore: FirebaseFirestore.instance,
    ),
  );

  getIt.registerLazySingleton<AddCommentRepo>(
    () => AddcommentRepoimp(datasrc: getIt<AddcommentDatasrcmeth>()),
  );

  getIt.registerLazySingleton<AddcommentUsecase>(
    () => AddcommentUsecase(repo: getIt<AddCommentRepo>()),
  );

  getIt.registerFactory<AddcommentBloc>(
    () => AddcommentBloc(usecase: getIt<AddcommentUsecase>()),
  );
}