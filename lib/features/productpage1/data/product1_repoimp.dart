import 'package:makanek/features/productpage1/domain/entity/product1_entity.dart';
import 'package:makanek/features/productpage1/domain/repo/product1_repo.dart';


class Product1Repoimp  implements Product1Repo{

  @override
  List<Product1Entity> product1Page() {
    return [
      Product1Entity(body:"Homemade, fresh, and made with love" , title:"Food", imagePath: 'assets/images/foodpot.png'),
      Product1Entity(body: "Hand-stitched designs for your unique style", title:"Clothes", imagePath: 'assets/images/shirt.png' ),
      Product1Entity(body:"One-of-a-kind art, decor, and gifts" , title: "Crafts", imagePath: 'assets/images/jar.png')
    ];
  }
}