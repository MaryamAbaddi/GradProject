



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/deleteitemfromcart/data/datasrc/deletefromcart_datasrcimp.dart';
import 'package:makanek/features/deleteitemfromcart/data/datasrc/deletefromcart_datasrcmeth.dart';
import 'package:makanek/features/deleteitemfromcart/data/repoimp/deletefromcart_repoimp.dart';
import 'package:makanek/features/deleteitemfromcart/domain/repo/deletefromcart_repo.dart';
import 'package:makanek/features/deleteitemfromcart/domain/usecase/deletefromcart_usecase.dart';
import 'package:makanek/features/deleteitemfromcart/presentation/cubit/deletefromcart_cubit.dart';
import 'package:makanek/features/getcartitems/data/datasrc/getcartitems_datasrcimp.dart';
import 'package:makanek/features/getcartitems/data/datasrc/getcartitems_datasrcmeth.dart';
import 'package:makanek/features/getcartitems/data/repoimp/getcartitems_repoimp.dart';
import 'package:makanek/features/getcartitems/domain/repo/getcartitems_repo.dart';
import 'package:makanek/features/getcartitems/domain/usecase/getcartitems_usecase.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_bloc.dart';

void initGetcartInjection() {
  getIt.registerLazySingleton<GetcartitemsDatasrcmeth>(
    () => GetcartitemsDatasrcimp(firebase: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<GetcartitemsRepo>(
    () => GetcartitemsRepoimp(
      datasrc: getIt<GetcartitemsDatasrcmeth>(),
    ),
  );

  getIt.registerLazySingleton<GetcartitemsUsecase>(
    () => GetcartitemsUsecase(repo: getIt<GetcartitemsRepo>()),
  );


  getIt.registerFactory<GetcartitemsBloc>(
    () => GetcartitemsBloc(
      usecase: getIt<GetcartitemsUsecase>(),
    ),
  );

  getIt.registerLazySingleton<DeletefromcartDatasrcmeth>(
    () => DeletefromcartDatasrcimp(firestore: FirebaseFirestore.instance),
  );

  getIt.registerLazySingleton<DeletefromcartRepo>(
    () => DeletefromcartRepoimp(datasrc: getIt<DeletefromcartDatasrcmeth>()),
  );

  getIt.registerLazySingleton<DeletefromcartUsecase>(
    () => DeletefromcartUsecase(repo: getIt<DeletefromcartRepo>()),
  );

  getIt.registerFactory<DeletefromcartCubit>(
    () => DeletefromcartCubit(usecase: getIt<DeletefromcartUsecase>()),
  );
}