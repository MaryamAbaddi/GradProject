import 'package:makanek/features/onboarding/domain/entity/onboard_entity.dart';
import 'package:makanek/features/onboarding/domain/repo/onboard_repo.dart';


class OnboardRepoImpl implements OnboardRepo {
  @override
  List<OnBoardEntity> getOnboardingPages() {
    return const [
      OnBoardEntity(
        imagePath: 'assets/images/pana.png',
        title: 'Support Local Talent ',
        subTitle: 'Discover unique, handmade products crafted with love by\ncreative women. From home-cooked meals to artistic crafts, find it all here',
      ),
      OnBoardEntity(
        imagePath: 'assets/images/rafiki.png',
        title: 'join a supportive community',
        subTitle: 'Connect with like-minded women, share your experiences, and find the mentorship you need to grow your business or hobby',
      ),
      OnBoardEntity(
        imagePath: 'assets/images/rafiki1.png',
        title: 'turn your passion into profit ',
        subTitle: 'Access exclusive workshops and tutorials designed to help you master new skills and manage your home-based business effectively',
      ),
    ];
  }
}