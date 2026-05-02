

// addpost_state.dart
part of 'addpost_bloc.dart';



abstract class AddpostState extends Equatable {
  const AddpostState();
  @override
  List<Object?> get props => [];
}

class AddpostInitial extends AddpostState {
  const AddpostInitial();
}

class AddpostLoading extends AddpostState {
  const AddpostLoading();
}

class AddpostSuccess extends AddpostState {
  final OutputEntity post;
  const AddpostSuccess({required this.post});
  @override
  List<Object?> get props => [post];
}

class AddpostError extends AddpostState {
  final String message;
  const AddpostError({required this.message});
  @override
  List<Object?> get props => [message];
}