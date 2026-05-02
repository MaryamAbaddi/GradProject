




part of 'getname_bloc.dart';


abstract class GetnameState extends Equatable {
  const GetnameState();
  @override 
  List<Object?> get props => [];
}

class GetnameInitial extends GetnameState {
  const GetnameInitial();
}

class GetnameLoading extends GetnameState {
  const GetnameLoading();
}

class GetnameSuccess extends GetnameState {
  final GetnameEntity user;
  const GetnameSuccess({required this.user});
  @override
  List<Object?> get props => [user];
}

class GetnameError extends GetnameState {
  final String message;
  const GetnameError({required this.message});
  @override
  List<Object?> get props => [message];
}