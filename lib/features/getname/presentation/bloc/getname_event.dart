



part of 'getname_bloc.dart';

abstract class GetnameEvent extends Equatable {
  const GetnameEvent();
  @override
  List<Object?> get props => [];
}

class GetnameFetched extends GetnameEvent {
  const GetnameFetched();
}