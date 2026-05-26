import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/coursepage/domain/usecase/course1_usecase.dart';
import 'package:makanek/features/coursepage/presentation/bloc/course1_events.dart';
import 'package:makanek/features/coursepage/presentation/bloc/course1_state.dart';


class Course1Bloc extends Bloc<Course1Event, Course1State> {
  final Course1Usecase usecase;

  Course1Bloc({required this.usecase}) : super(Course1Initial()) {
    on<LoadCourse1Event>((event, emit) {
      emit(Course1Loaded(courses: usecase.call()));
    });
  }
}

