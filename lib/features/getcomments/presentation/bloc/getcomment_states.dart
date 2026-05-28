import 'package:equatable/equatable.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';

abstract class GetcommentState extends Equatable {

  @override
  List<Object?> get props => [];
}

class GetcommentInitial extends GetcommentState {

}

class GetcommentLoading extends GetcommentState {
}

class GetcommentError extends GetcommentState{
  final String message;

  GetcommentError({required this.message});
  
  @override
  List<Object?> get props => [message];
}
class GetcommentSuccess extends GetcommentState {

  final List<CommentOutput> comments;
  GetcommentSuccess(this.comments);
  
  @override
  List<Object?> get props => [comments];
}