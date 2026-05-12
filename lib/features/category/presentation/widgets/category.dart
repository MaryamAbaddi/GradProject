import 'package:flutter/material.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/features/category/domain/Entity/category_entity.dart';
import 'package:makanek/features/category/presentation/widgets/category_button.dart';

class Category extends StatelessWidget {
  final List<CategoryEntity> categories;
  const Category({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Card(
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: context.screenWidth,
          height: context.screenHeight*0.18,
          padding: const EdgeInsets.only(top: 16), 
          child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: (context.screenWidth - (categories.length * context.screenWidth * 0.22)) / 60,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) => CategoryButton(
              imagePath: categories[index].imagePath,
              title: categories[index].title, route: categories[index].route,
            ),
          ),
        ),
      ),
    );
  }
}