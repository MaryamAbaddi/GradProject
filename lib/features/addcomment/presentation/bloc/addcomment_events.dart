



import 'package:equatable/equatable.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_input.dart';

class AddcommentEvents extends Equatable {

  const AddcommentEvents();

  @override 
  List<Object?> get props => [];
}

class CommentSubmitted extends AddcommentEvents{
  final AddcommentInput commentInput;
  const CommentSubmitted({required this.commentInput});

  @override 
  List<Object?> get props => [commentInput];
}