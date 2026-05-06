

part of 'getpost_bloc.dart';

abstract class GetpostState extends Equatable {
  const GetpostState();
  @override
  List<Object?> get props => [];
}

class GetpostInitial extends GetpostState {
  const GetpostInitial();
}

class GetpostLoading extends GetpostState {
  const GetpostLoading();
}

class GetpostSuccess extends GetpostState {
  final List<OutputEntity> posts;
  const GetpostSuccess({required this.posts});
  @override
  List<Object?> get props => [posts];
}

class GetpostError extends GetpostState {
  final String message;
  const GetpostError({required this.message});
  @override
  List<Object?> get props => [message];
}

class DeletePostLoading extends GetpostState {
  const DeletePostLoading();
}
class DeletePostSuccess extends GetpostState {
  const DeletePostSuccess();
}

class DeletePostError extends GetpostState{
  final String message;
  const DeletePostError({required this.message});
}