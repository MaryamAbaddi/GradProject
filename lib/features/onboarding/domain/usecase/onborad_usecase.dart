



import 'package:makanek/features/onboarding/domain/entity/onboard_entity.dart';
import 'package:makanek/features/onboarding/domain/repo/onboard_repo.dart';

class GetOnboardingPages{

  final OnboardRepo repo;
  GetOnboardingPages(this.repo);

  List<OnBoardEntity> call()
  {
    return repo.getOnboardingPages();
  }
}




