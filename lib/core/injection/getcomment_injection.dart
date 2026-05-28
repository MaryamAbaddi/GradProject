


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/getcomments/data/datasrc/getcomment_datasrcimp.dart';
import 'package:makanek/features/getcomments/data/datasrc/getcomment_datasrcmeth.dart';
import 'package:makanek/features/getcomments/data/repoimp/getcomment_repoimp.dart';
import 'package:makanek/features/getcomments/domain/repo/getcomments_repo.dart';
import 'package:makanek/features/getcomments/domain/usecase/getcomment_usecase.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_bloc.dart';

void initGetCommentInjection() {
  getIt.registerLazySingleton<GetcommentDatasrcmeth>(
    () => GetcommentDatasrcimp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<GetcommentsRepo>(
    () => GetcommentRepoimp(
      datasrc: getIt<GetcommentDatasrcmeth>(),
    ),
  );

  getIt.registerLazySingleton<GetcommentUsecase>(
    () => GetcommentUsecase(repo: getIt<GetcommentsRepo>()),
  );

  getIt.registerFactory<GetcommentBloc>(
    () => GetcommentBloc(
      usecase: getIt<GetcommentUsecase>(),
    ),
  );
}