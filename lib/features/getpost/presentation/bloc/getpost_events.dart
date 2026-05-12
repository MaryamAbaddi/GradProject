


part of 'getpost_bloc.dart';


abstract class GetpostEvent extends Equatable {
  const GetpostEvent();
  @override
  List<Object?> get props => [];
}

class GetPostsFetched extends GetpostEvent {
  final bool isOffline;
  const GetPostsFetched({this.isOffline = false});
}

class DeletePostEvent extends GetpostEvent{
  final String postId;
  const DeletePostEvent({required this.postId});
}

class EditPostEvent extends GetpostEvent {
  final String postId;
  final String newBody;
  const EditPostEvent({required this.postId, required this.newBody});
}
