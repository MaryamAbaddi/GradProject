





import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';

abstract class GetpostRepo {

  Future<List<OutputEntity>> getPost();
}