


import 'package:makanek/features/servicepage1/domain/entity/service1_entity.dart';
import 'package:makanek/features/servicepage1/domain/repo/service1_repo.dart';

class Service1Repoimp  implements Service1Repo{


  @override
  List<Service1Entity> service1Page() {
    return [
      Service1Entity(body:"Reliable, professional cleaning services \n for your home. " , title:"House Keeping", imagePath: 'assets/images/cleaning.png'),
      Service1Entity(body: "Safe and loving care for your little ones. ", title:"Baby Sitting", imagePath: 'assets/images/baby.png' ),
      Service1Entity(body:"Personalized academic support for all levels. " , title: "Private teaching", imagePath: 'assets/images/teaching.png')
    ];
  }
}