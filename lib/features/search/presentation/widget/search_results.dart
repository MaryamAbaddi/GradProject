import 'package:flutter/material.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';

class SearchResults extends StatelessWidget {
  final List<SearchResultEntity> results;

  const SearchResults({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.primary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Search Results', style: TextStyle(color: colors.primary)),
      ),
      body: results.isEmpty
          ? const Center(child: Text('No results found'))
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                return ListTile(
                  leading: Icon(
                    item.type == 'product' ? Icons.inventory_2 : Icons.build,
                    color: colors.primary,
                  ),
                  title: Text(item.title),
                  subtitle: Text(item.type),
                );
              },
            ),
    );
  }
}