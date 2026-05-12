import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/getpost/data/datasrc/getpost_datasrcmeth.dart';
import 'package:makanek/features/getpost/data/datasrc/getpost_localdata.dart';
import 'package:makanek/features/getpost/domain/repo/getpost_repo.dart';

class GetpostRepoimp implements GetpostRepo {
  final GetpostDatasrcmeth datasrc;
  final GetpostLocalDatasrc localDatasrc;

     GetpostRepoimp({
    required this.datasrc,
    required this.localDatasrc,
  });

  @override
  Future<List<OutputEntity>> getPost({bool isOffline = false}) async {
    if (isOffline) {
      return localDatasrc.getCachedPosts();
    }
    final posts = await datasrc.getPost();
    await localDatasrc.cachePosts(posts);
    return posts;
  }
}