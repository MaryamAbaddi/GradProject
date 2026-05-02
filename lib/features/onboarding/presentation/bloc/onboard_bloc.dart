import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/onboarding/domain/entity/onboard_entity.dart';
import 'package:makanek/features/onboarding/domain/usecase/onborad_usecase.dart';



part 'onboard_state.dart';
part 'onboard_event.dart';


class OnboardBloc extends Bloc<OnboardEvent,OnboardState> {

final GetOnboardingPages getOnboardingPages;
  OnboardBloc({required this.getOnboardingPages}): super(const OnboardingInitial()){

    on<OnboardStarted>
    ((event, emit){
     final entity = getOnboardingPages();
     emit(OnboardingLoaded(entity: entity));
    });
  on<OnboardingNext>((event,emit){
    if(event.currentPage == 2) {
      emit(const OnboardingSuccess());
    } else {
      emit(OnboardingPageChanged(pageIndex: event.currentPage+1));
    }
      }
    );
  }
}