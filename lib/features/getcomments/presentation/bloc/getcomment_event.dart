import 'package:equatable/equatable.dart';

abstract class GetcommentEvent extends Equatable {
  const GetcommentEvent();

@override
  List<Object?> get props => [];
}

class GetcommentSubmitted extends GetcommentEvent {
  final String postId;
 const  GetcommentSubmitted(this.postId);
  
  @override
  List<Object?> get props => [];
}