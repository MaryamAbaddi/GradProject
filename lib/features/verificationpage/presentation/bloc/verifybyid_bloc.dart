




import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/verificationpage/domain/entity/verifybyid_input.dart';
import 'package:makanek/features/verificationpage/domain/usecase/verifybyid_usecase.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_events.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_state.dart';

class VerifybyidBloc extends Bloc<VerifybyidEvents,VerifybyidState>{
    final VerifybyidUsecase usecase;

  VerifybyidBloc({required this.usecase}):super(const VerifybyidInitial())
  {
    on<VerfiybyIdSubmitted> ((event,emit) async{
    emit(const VerifybyidLoading());
      try{
        final input = VerifybyidInput(imageUrl: event.imageUrl, uid: event.uid);
        await usecase.calls(input);
        emit(const VerifybyidSuccess());
      }
      catch(e)
      {
      emit(VerifybyidError(e.toString()));
      }
    }
    );
    
}
}