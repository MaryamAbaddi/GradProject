




import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getcartitems/domain/usecase/getcartitems_usecase.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_events.dart';
import 'package:makanek/features/getcartitems/presentation/bloc/getcartitems_state.dart';

class GetcartitemsBloc extends Bloc<GetcartitemsEvents,GetcartitemsState>  {
  final GetcartitemsUsecase usecase;

  GetcartitemsBloc({required this.usecase}):super(GetcartitemsInit()){
  on<GetcartitemsStarted>( (event,emit) async{
    emit(GetcartitemsLoading());
    try{
      final item =  await usecase.calls();
      emit(GetcartitemsSuccess(items:item));
    }
    catch (e){
      emit(GetcartitemsError(message:"An error occured!"));
    }
  });
} 
} 