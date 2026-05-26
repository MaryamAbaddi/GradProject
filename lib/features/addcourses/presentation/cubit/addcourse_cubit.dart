import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/addcourses/domain/entity/addcourse_input.dart';
import 'package:makanek/features/addcourses/domain/usecase/addcourse_usecase.dart';

part 'addcourse_state.dart';

class AddCourseCubit extends Cubit<AddCourseState> {
  final AddcourseUsecase usecase;

  AddCourseCubit({required this.usecase}) : super(AddCourseInitial());

  Future<void> addCourse(String title, String imagePath) async {
    try {
      await usecase.calls(AddcourseInput(title: title, imagePath: imagePath));
      emit(AddCourseSuccess());
    } catch (e) {
      emit(AddCourseError(message: e.toString()));
    }
  }
}

