




import 'package:equatable/equatable.dart';

abstract class GetproductEvent extends Equatable {
  const GetproductEvent();
  @override
  List<Object?> get props => [];
}

class GetproductFetched extends GetproductEvent {
  const GetproductFetched();
}

