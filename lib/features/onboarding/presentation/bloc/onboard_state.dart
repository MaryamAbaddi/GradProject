
part of 'onboard_bloc.dart';



abstract class OnboardState extends Equatable{

  const OnboardState();

  @override
  List<Object?> get props => [];
} 



class OnboardingInitial extends OnboardState{
  const OnboardingInitial();
}

class OnboardingLoading extends OnboardState{
  const OnboardingLoading();
}

class OnboardingLoaded extends OnboardState {
  final List<OnBoardEntity> entity;
  const OnboardingLoaded({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class OnboardingSuccess extends OnboardState{
  const OnboardingSuccess(); 
}

class OnboardingError extends OnboardState{
  final String message;
  const OnboardingError({required this.message});

  @override
  List<Object?> get props => [message];
}
class OnboardingPageChanged extends OnboardState{
  final int pageIndex;
  const OnboardingPageChanged({required this.pageIndex});

  @override
  List<Object?> get props => [pageIndex];
}









