



import 'package:makanek/features/addtocart/data/datasrc/addtocart_datasrcmeth.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_input.dart';
import 'package:makanek/features/addtocart/domain/entity/addtocart_output.dart';
import 'package:makanek/features/addtocart/domain/repo/addtocart_repo.dart';

class AddtocartRepoimp implements AddtocartRepo{
  final AddtocartDatasrcmeth datasrc;

  AddtocartRepoimp({required this.datasrc});
  @override
  Future<AddtocartOutput> addtocart(AddtocartInput input) {
    return datasrc.addtocart(input);

  }

  
} 