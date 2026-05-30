



import 'package:equatable/equatable.dart';
import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';

class GetcourseState extends Equatable {
  const GetcourseState();

  @override
  List<Object?> get props => [];
}


class GetcourseInit extends GetcourseState{}

class GetcourseError extends GetcourseState{
  final String message;

   const GetcourseError({required this.message});
  
   @override
  List<Object?> get props => [message];
}

class GetcourseLoading extends GetcourseState{}

class GetcourseSuccess extends GetcourseState{
  final List<GetcoursesOutput> courses;
  const GetcourseSuccess({required this.courses}); 

   @override
  List<Object?> get props => [courses];
}


class DeletecourseError extends GetcourseState{
  final String message;

  const DeletecourseError({required this.message});
  
  @override
  List<Object?> get props => [message];
}

class DeletecourseLoading extends GetcourseState{}





