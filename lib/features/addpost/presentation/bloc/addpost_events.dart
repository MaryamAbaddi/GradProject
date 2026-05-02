// addpost_event.dart
part of 'addpost_bloc.dart';


abstract class AddpostEvent extends Equatable {
  const AddpostEvent();
  @override
  List<Object?> get props => [];
}

class AddPostSubmitted extends AddpostEvent {
  final String? imageUrl;
  final String body;
  const AddPostSubmitted({required this.imageUrl, required this.body});
  @override
  List<Object?> get props => [imageUrl, body];
}