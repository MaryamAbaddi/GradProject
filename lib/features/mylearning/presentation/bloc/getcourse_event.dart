






import 'package:equatable/equatable.dart';

class GetcourseEvent extends Equatable {
  const GetcourseEvent();

  @override
  List<Object?> get props => [];
}



class CourseLoaded extends GetcourseEvent{}

class DeleteCoure extends GetcourseEvent{
  final String title;

   const DeleteCoure({required this.title});
  @override
  List<Object?> get props => [title];
}