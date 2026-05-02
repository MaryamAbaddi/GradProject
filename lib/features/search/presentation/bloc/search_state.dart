part of 'search_bloc.dart';

abstract class SearchState extends Equatable{

  const SearchState();
  @override
  List<Object?> get props => [];
}

class SearchInit extends SearchState{
  const SearchInit();
}

class SearchLoading extends SearchState{
    const SearchLoading();
}

class SearchError extends SearchState{
  final String message;
  const SearchError({required this.message});
  @override 
  List<Object?> get props => [message];
}

class SearchSuccess extends SearchState{
  final List<SearchResultEntity> results;
  const SearchSuccess({required this.results});
  @override
  List<Object?> get props => [results];
}


