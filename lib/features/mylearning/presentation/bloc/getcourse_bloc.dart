import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/deletepost/unenroll-course/domain/usecase/unenrollcourse_usecase.dart';
import 'package:makanek/features/mylearning/domain/usecase/getcourse_usecase.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_event.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_state.dart';

class GetcourseBloc extends Bloc<GetcourseEvent, GetcourseState> {
  final GetcourseUsecase usecase;
  final UnenrollUsecase deleteusecase;

  GetcourseBloc({required this.usecase, required this.deleteusecase}) : super(GetcourseInit()) {
    on<CourseLoaded>((event, emit) async {
      emit(GetcourseLoading());
      try {
        final courses = await usecase.calls();
        emit(GetcourseSuccess(courses: courses));
      } catch (e) {
        emit(GetcourseError(message: e.toString()));
      }
    });
    on<DeleteCoure>((event,emit) async{
      emit(DeletecourseLoading());
      try{
         await deleteusecase.calls(event.title);
        add(CourseLoaded());
      }
      catch (e) {
    emit(DeletecourseError(message: 'An error occurred!'));
      }
      });
  }
}