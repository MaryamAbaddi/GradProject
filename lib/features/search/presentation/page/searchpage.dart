import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/features/search/presentation/bloc/search_bloc.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<SearchBloc>(),
      child: Scaffold(
        backgroundColor: colors.surface,
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: BlocConsumer<SearchBloc, SearchState>(
            listener: (context, state) {
              if (state is SearchError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is SearchLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.primary,
                  ),
                );
              }
              /*if (state is SearchSuccess) {
                return SearchResults(results: state.results);
              }*/
              return SearchBar(); 
            },
          ),
        ),
      ),
    );
  }
}