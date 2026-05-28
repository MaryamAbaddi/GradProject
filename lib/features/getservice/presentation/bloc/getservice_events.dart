



import 'package:equatable/equatable.dart';

class GetserviceEvents extends Equatable {
  const GetserviceEvents();
  @override 
  List<Object?> get props => [];
}


class GetServiceDataFetch extends GetserviceEvents{
}

class FilterService extends GetserviceEvents {
  final String? filter;
  final String? currentUserId;

  const FilterService({this.filter, this.currentUserId});

  @override
  List<Object?> get props => [filter, currentUserId];
}