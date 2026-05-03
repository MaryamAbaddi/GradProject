



import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_card.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/productpage1/domain/entity/product1_entity.dart';

class Product1Layout extends StatelessWidget {
  final List<Product1Entity> products;
  const Product1Layout({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0,
                  title: AppText(text: 'Back',textColor: colors.primary,textSize: 16,fontWeight: FontWeight.bold,)
                ,backgroundColor: Colors.white, 
                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios,size: 15,
                color: colors.primary,),),),
                backgroundColor: Colors.white,
                body:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16, top: 40, bottom: 20), // ✅ controls spacing
                      child:AppTitle(
                      size: 35,
                      title: 'Products',
                      weight: FontWeight.bold,
                      titleColor: colors.primary,
                      textAlign: TextAlign.start,
                    ),),
                ListView.builder(
                  shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final Product1Entity product = products[index];
                  return 
                  AppCard(
                    title: product.title,
                    body: product.body,
                    imagePath: product.imagePath,
                  );
                },
        )]));

  }
}

