import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/mylearning/domain/usecase/getcourse_usecase.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_event.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_state.dart';

class GetcourseBloc extends Bloc<GetcourseEvent, GetcourseState> {
  final GetcourseUsecase usecase;

  GetcourseBloc({required this.usecase}) : super(GetcourseInit()) {
    on<CourseLoaded>((event, emit) async {
      emit(GetcourseLoading());
      try {
        final courses = await usecase.calls();
        emit(GetcourseSuccess(courses: courses));
      } catch (e) {
        emit(GetcourseError(message: e.toString()));
      }
    });
  }
}