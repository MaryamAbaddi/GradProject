import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_card.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/servicepage1/domain/entity/service1_entity.dart';

class Service1layout extends StatelessWidget {
  final List<Service1Entity> services;
  const Service1layout({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: AppText(text: 'Back', textColor: colors.primary, textSize: 16, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 15, color: colors.primary),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 40, bottom: 20),
            child: AppTitle(
              size: 35,
              title: 'Services',
              weight: FontWeight.bold,
              titleColor: colors.primary,
              textAlign: TextAlign.start,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: services.length,
            itemBuilder: (context, index) {
              final Service1Entity service = services[index];
              return AppCard(
                title: service.title,
                body: service.body,
                imagePath: service.imagePath,
              );
            },
          ),
        ],
      ),
    );
  }
} 


