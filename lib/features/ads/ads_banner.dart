import 'package:flutter/material.dart';
import 'package:makanek/features/ads/adcard.dart';

class AdsBanner extends StatelessWidget {
  const AdsBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final ads = [
      {'image': 'assets/images/doc.jpeg', 'title': 'Vital Care','subtitle': 'Master the life-saving skills needed to handle home emergencies'},
      {'image': 'assets/images/mom.jpeg', 'title': 'Raising Tomorrow',  'subtitle': 'Modern tool and psychological insights for a stronger bond with your children'},
      {'image': 'assets/images/cook.png', 'title': 'Culinary Arts', 'subtitle': 'Discover the secrets of gourmet recipes and professional plating techniques'},
    ];

    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: ads.length,
        itemBuilder: (context, index) => AdCard(
          imagePath: ads[index]['image']!,
          title: ads[index]['title']!,
          subtitle: ads[index]['subtitle']!,
        ),
      ),
    );
  }
}