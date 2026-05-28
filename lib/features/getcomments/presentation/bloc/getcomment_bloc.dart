import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getcomments/domain/usecase/getcomment_usecase.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_event.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_states.dart';

class GetcommentBloc extends Bloc<GetcommentEvent, GetcommentState> {
  final GetcommentUsecase usecase;

  GetcommentBloc({required this.usecase}) : super(GetcommentInitial()) {
    on<GetcommentSubmitted>((event, emit) async {
      emit(GetcommentLoading());
      try {
        final comments = await usecase.calls(event.postId);
        emit(GetcommentSuccess(comments));
      } catch (e) {
        emit(GetcommentError( message: 'An error occured!'));
      }
    });
  }
}