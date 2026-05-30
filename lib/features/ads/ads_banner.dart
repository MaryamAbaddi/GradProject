import 'dart:async';
import 'package:flutter/material.dart';
import 'package:makanek/features/ads/adcard.dart';

class AdsBanner extends StatefulWidget {
  const AdsBanner({super.key});

  @override
  State<AdsBanner> createState() => _AdsBannerState();
}

class _AdsBannerState extends State<AdsBanner> {
  late PageController _pageController;
  Timer? _timer;
  int _currentPage = 0;

  final ads = [
    {'image': 'assets/images/doc.jpeg', 'title': 'Vital Care', 'subtitle': 'Master the life-saving skills needed to handle home emergencies'},
    {'image': 'assets/images/mom.jpeg', 'title': 'Raising Tomorrow', 'subtitle': 'Modern tool and psychological insights for a stronger bond with your children'},
    {'image': 'assets/images/cook.png', 'title': 'Culinary Arts', 'subtitle': 'Discover the secrets of gourmet recipes and professional plating techniques'},
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 7), (_) {
      _currentPage = (_currentPage + 1) % ads.length;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) => _currentPage = index,
        itemCount: ads.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: AdCard(
            imagePath: ads[index]['image']!,
            title: ads[index]['title']!,
            subtitle: ads[index]['subtitle']!,
          ),
        ),
      ),
    );
  }
}