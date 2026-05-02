import '../../features/onboarding/data/onboard_repo_impl.dart';
import '../../features/onboarding/domain/usecase/onborad_usecase.dart';
import '../../features/onboarding/presentation/bloc/onboard_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';



void initOnboardingInjection() {
  // 1. Repository
  getIt.registerLazySingleton<OnboardRepoImpl>(
    () => OnboardRepoImpl(),
  );

  // 2. Use Case
  getIt.registerLazySingleton<GetOnboardingPages>(
    () => GetOnboardingPages(getIt<OnboardRepoImpl>()),
  );

  // 3. Bloc
  getIt.registerFactory<OnboardBloc>(
    () => OnboardBloc(getOnboardingPages: getIt<GetOnboardingPages>()),
  );
}