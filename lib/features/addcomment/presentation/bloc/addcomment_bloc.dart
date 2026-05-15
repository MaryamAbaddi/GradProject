



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addcomment/domain/usecase/addcomment_usecase.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_events.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_state.dart';

class AddcommentBloc extends Bloc<AddcommentEvents,AddcommentState> {

  final AddcommentUsecase usecase;

  AddcommentBloc({required this.usecase}):super(CommentInit()){
    on<CommentSubmitted>((event,emit) async{
      emit(CommentLoading());
    try{
    final result= usecase.calls(event.commentInput);
      emit(CommentSuccess(comment: await result));
    }
    catch(e){
        emit(CommentError(message: 'An Error occured!'));
        }
      }
    );
  }
}