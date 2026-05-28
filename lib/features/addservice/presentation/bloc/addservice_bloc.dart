



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addservice/domain/entity/addservice_input.dart';
import 'package:makanek/features/addservice/domain/usecase/addservice_usecase.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_events.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_state.dart';

class AddserviceBloc extends Bloc<AddserviceEvent, AddserviceState> {
  final AddserviceUsecase usecase;

  bool _isProcessing = false;

  AddserviceBloc({required this.usecase}) : super(AddserviceInitial()) {
    on<AddserviceSubmitted>((event, emit) async {
      if (_isProcessing) return;

      _isProcessing = true;

      emit( AddserviceLoading());

      try {
        final input = AddserviceInput(
          serviceType: event.serviceType,
          phoneNumber: event.phoneNumber,
          priceService: event.price, 
        );

        final result = await usecase.calls(input);

        emit(AddserviceSuccess(service:result));
      } catch (e) {
        emit(AddserviceError(message: e.toString()));
      }

      _isProcessing = false;
    });
  }
}