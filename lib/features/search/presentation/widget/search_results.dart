import 'package:flutter/material.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/search/domain/entities/search_outentity.dart';

class SearchResults extends StatelessWidget {
  final List<SearchResultEntity> results;

  const SearchResults({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.onPrimary,
      appBar: AppBar(
        backgroundColor: colors.onPrimary,
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
                    color: colors.surface,
                  ),
                  title: AppText(text:item.title,fontWeight: FontWeight.bold,textColor: colors.primary,textAlign: TextAlign.start,),
                  subtitle:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     AppText(text:item.type,textColor: colors.primary,),
                     Spacer(),
                     AppText(text:item.price.toString(),textColor: colors.primary),
                  ],),
                  onTap: (){
                  if (item.type == 'product') {
                      Navigator.pushNamed(context, AppRoutes.product, arguments: item.id);
                  }
                  else 
                    {
                      Navigator.pushNamed(context, AppRoutes.service, arguments: item.id);
                    }
                  }
                );
              },
            ),
    );
  }
}