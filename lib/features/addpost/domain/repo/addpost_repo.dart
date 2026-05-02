



import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';

abstract class AddpostRepo {
  Future<OutputEntity> addpost(InputEntity input);
}