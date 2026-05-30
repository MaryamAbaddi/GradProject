




import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/deleteservice/domain/usecase/deleteservice_usecase.dart';
import 'package:makanek/features/getservice/domain/usecase/getservice_usecase.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_state.dart';

class GetserviceBloc extends Bloc<GetserviceEvents,GetserviceState>{
  final GetserviceUsecase usecase;
  final DeleteserviceUsecase deleteusecase;

  GetserviceBloc({required this.usecase, required this.deleteusecase}):super(InitGetService()){
    on<GetServiceDataFetch>((event,emit) async{
    emit(LoadingGetService());
    try{
      final service = await usecase.call();
      emit(SuccessGetService(services: service));

    }
    catch(e){
      print('Error');
       emit(ErrorGetService(message: e.toString()));
      }
      }
    );
    on<FilterService>((event,emit) async{
      emit(LoadingGetService());
      try {
        final services = await usecase.call();
        final filtered = event.filter == null
            ? services
            : event.filter == 'My posts'
                ? services.where((s) => s.ownerId == event.currentUserId).toList()
                : services.where((s) => s.serviceType.toLowerCase() == event.filter!.toLowerCase()).toList();
        emit(SuccessGetService(services: filtered));
      } catch (e) {
        emit(ErrorGetService(message: e.toString()));
      }
      }
    );
    on<DeleteServiceEvent>((event,emit) async{
      emit(const DeleteServiceLoading());
        try{
        await deleteusecase.calls(event.serviceId);
        emit(DeleteServiceSuccess());
        add(GetServiceDataFetch());
        } catch(e){
          emit(DeleteServiceError(message: 'An error occured!')); 
        }
    });
  }
}