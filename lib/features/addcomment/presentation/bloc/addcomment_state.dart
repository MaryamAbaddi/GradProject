



import 'package:equatable/equatable.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

class AddcommentState extends Equatable {

  const AddcommentState();
  @override
  List<Object?> get props => [];
}


class CommentInit extends AddcommentState{}

class CommentLoading extends AddcommentState{}

class CommentError extends AddcommentState{
  final String message;

 const CommentError({required this.message});
  @override
  List<Object?> get props => [message];
}

class CommentSuccess extends AddcommentState{
  final CommentOutput comment;
  const CommentSuccess({required this.comment});

  @override
  List<Object?> get props => [comment];
}


