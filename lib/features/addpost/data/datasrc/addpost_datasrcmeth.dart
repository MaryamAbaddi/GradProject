



import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';

abstract class AddpostDatasrcmeth {
  Future<OutputEntity> addPost(InputEntity input);
}