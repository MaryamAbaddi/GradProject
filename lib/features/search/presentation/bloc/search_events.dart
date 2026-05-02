




part of 'search_bloc.dart';

abstract class SearchEvents extends Equatable {
  const  SearchEvents();

  @override 
  List<Object?> get props =>  [];
}


class SearchStarted extends SearchEvents{
  final String query;
  const SearchStarted({required this.query});
  @override
    List<Object?> get props =>  [query];

}


class SearchFinished extends SearchEvents{
  const SearchFinished();
}