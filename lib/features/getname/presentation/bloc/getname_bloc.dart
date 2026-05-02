

// getname_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getname/domain/entity/getname_entity.dart';
import 'package:makanek/features/getname/domain/usecase/getname_usecase.dart';

part 'getname_state.dart';
part 'getname_event.dart';

class GetnameBloc extends Bloc<GetnameEvent, GetnameState> {
  final GetnameUsecase usecase;

  GetnameBloc({required this.usecase}) : super(const GetnameInitial()) {
    on<GetnameFetched>((event, emit) async {
      emit(const GetnameLoading());
      try {
        final result = await usecase.call();
        emit(GetnameSuccess(user: result));
      } catch (e) {
        emit(GetnameError(message: e.toString()));
      }
    });
  }
}