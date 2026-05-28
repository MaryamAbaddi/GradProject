


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getpurchases/domain/usecase/getpurchases_usecase.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_events.dart';
import 'package:makanek/features/getpurchases/presentation/bloc/getpurchases_state.dart';

class GetpurchasesBloc extends Bloc<GetpurchasesEvents,GetpurchasesState>{
  
  final GetpurchasesUsecase usecase;
  GetpurchasesBloc({required this.usecase}):super(GetPurchasesinit()){
    on<PurchaseSubmitted>((event,emit) async{
      emit(GetPurchasesLoad());
      try{
        final purchases = await usecase.calls();
        emit(GetPurchasesSucces(purchases: purchases));
      }
      catch(e){
        emit(GetPurchasesError(message: "An Error occured!"));
      }
    });
  }
  

  
}