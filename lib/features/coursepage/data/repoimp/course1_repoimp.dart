


import 'package:makanek/features/coursepage/domain/entity/course1_entity.dart';
import 'package:makanek/features/coursepage/domain/repo/course1_repo.dart';


class Course1Repoimp  implements Course1Repo{


  @override
  List<Course1Entity> course1Page() {
    return [
      Course1Entity(body:"Master traditional and modern recipes. Cook with passion and create delicious memories" , title:"Culinary Arts", imagePath: 'assets/images/art.png'),
      Course1Entity(body:"Turn fabric into fashion. Learn sewing basics and create your own unique, handmade pieces", title:"Tailoring & Design", imagePath: 'assets/images/needle.png' ),
      Course1Entity(body:"Be prepared for anything. Learn essential life-saving skills to protect those who matter most" , title: "First Aid", imagePath: 'assets/images/firstaid.png'),
      Course1Entity(body:"/Unlock your potential. Gain the tools and confidence to navigate life's challenges with ease" , title: "Life coaching", imagePath: 'assets/images/loveletter.png'),

    ];
  }
}