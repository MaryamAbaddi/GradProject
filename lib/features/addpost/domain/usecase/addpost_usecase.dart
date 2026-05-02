




import 'package:makanek/features/addpost/domain/entity/addpost_input.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/addpost/domain/repo/addpost_repo.dart';

class AddpostUsecase {
  final AddpostRepo repo; 

  const AddpostUsecase ({required this.repo});

    Future<OutputEntity> calls(InputEntity input) async
    {
      return await repo.addpost(input);
    }

}