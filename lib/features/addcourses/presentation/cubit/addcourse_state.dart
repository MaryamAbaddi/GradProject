

part of 'addcourse_cubit.dart';


abstract class AddCourseState extends Equatable {
  const AddCourseState();
  @override
  List<Object?> get props => [];
}

class AddCourseInitial extends AddCourseState {
  const AddCourseInitial();
}

class AddCourseSuccess extends AddCourseState {
  const AddCourseSuccess();
}

class AddCourseError extends AddCourseState {
  final String message;
  const AddCourseError({required this.message});
  @override
  List<Object?> get props => [message];
}