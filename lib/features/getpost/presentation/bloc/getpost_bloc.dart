// getpost_bloc.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/deletepost/domain/usecase/delete_usecase.dart';
import 'package:makanek/features/getpost/domain/usecase/getpost_usecase.dart';

part 'getpost_state.dart';
part 'getpost_events.dart';

class GetpostBloc extends Bloc<GetpostEvent, GetpostState> {
  final GetpostUsecase usecase;
  final DeleteUsecase deleteUsecase;
  GetpostBloc({required this.usecase,required this.deleteUsecase}) : super(const GetpostInitial()) {
    on<GetPostsFetched>((event, emit) async {
      emit(const GetpostLoading());
      try {
        final posts = await usecase.call();
        emit(GetpostSuccess(posts: posts));
      } catch (e) {
        emit(GetpostError(message: e.toString()));
      }
    });
    on<DeletePostEvent>((event,emit) async{
      emit(const DeletePostLoading());
        try{
        await deleteUsecase.call(event.postId);
        emit(DeletePostSuccess());
        add(GetPostsFetched());
        } catch(e){
          emit(DeletePostError(message: 'An error occured!')); 
        }
    }
    );
  }
}