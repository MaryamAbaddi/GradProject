import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/search/domain/entities/search_inentity.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';
import 'package:makanek/features/search/domain/usecase/search_usecase.dart';


part 'search_state.dart';
part 'search_events.dart';

class SearchBloc extends Bloc<SearchEvents, SearchState> {
  final SearchUsecase searchUsecase;

  SearchBloc({required this.searchUsecase}) : super(const SearchInit()) {
    on<SearchStarted>((event, emit) async {
      emit(const SearchLoading());
      try {
        final results = await searchUsecase.call(SearchInentity(query: event.query));
        emit(SearchSuccess(results: results));
      } catch (e) {
        emit(SearchError(message: e.toString()));
      }
    });

    on<SearchFinished>((event, emit) {
      emit(const SearchInit());
    });
  }
}