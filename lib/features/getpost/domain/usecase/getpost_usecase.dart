import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/getpost/domain/repo/getpost_repo.dart';

class GetpostUsecase {
  final GetpostRepo repo; 

  const GetpostUsecase ({required this.repo});

    Future<List<OutputEntity>> call() async
    {
      return await repo.getPost();
    }

}