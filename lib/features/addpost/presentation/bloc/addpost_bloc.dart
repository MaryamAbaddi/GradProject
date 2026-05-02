import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/addpost/domain/usecase/addpost_usecase.dart';

part 'addpost_state.dart';
part 'addpost_events.dart';

class AddpostBloc extends Bloc<AddpostEvent, AddpostState> {
  final AddpostUsecase usecase;

  bool _isProcessing = false;

  AddpostBloc({required this.usecase}) : super(const AddpostInitial()) {
    on<AddPostSubmitted>((event, emit) async {
      if (_isProcessing) return;

      _isProcessing = true;

      emit(const AddpostLoading());

      try {
        final input = InputEntity(
          body: event.body,
          imagePath: event.imageUrl,
        );

        final result = await usecase.calls(input);

        emit(AddpostSuccess(post: result));
      } catch (e) {
        emit(AddpostError(message: e.toString()));
      }

      _isProcessing = false;
    });
  }
}