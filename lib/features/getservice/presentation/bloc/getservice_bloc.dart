




import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getservice/domain/usecase/getservice_usecase.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_state.dart';

class GetserviceBloc extends Bloc<GetserviceEvents,GetserviceState>{
  final GetserviceUsecase usecase;

  GetserviceBloc({required this.usecase}):super(InitGetService()){
    on<GetServiceDataFetch>((event,emit) async{
    emit(LoadingGetService());
    try{
      final service = await usecase.call();
      print('are you hereeee?');
      emit(SuccessGetService(services: service));

    }
    catch(e){
      print('Error');
       emit(ErrorGetService(message: e.toString()));
      }
      }
    );
  }
}