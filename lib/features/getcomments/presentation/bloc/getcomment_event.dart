import 'package:equatable/equatable.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

abstract class GetcommentEvent extends Equatable {
  const GetcommentEvent();

@override
  List<Object?> get props => [];
}

class GetcommentSubmitted extends GetcommentEvent {
  final String postId;
 const  GetcommentSubmitted({required this.postId});
  
  @override
  List<Object?> get props => [];
}

class AddCommentToList extends GetcommentEvent {
  final CommentOutput comment;
   const AddCommentToList({required this.comment});
}