


import 'package:hive/hive.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';

class GetpostLocalDatasrc {
  static const String _boxName = 'posts';

  Future<void> cachePosts(List<OutputEntity> posts) async {
    final box = await Hive.openBox(_boxName);
    final postsMap = posts.map((post) => {
      'id': post.id,
      'uid': post.uid,
      'body': post.body,
      'imageUrl': post.imageUrl,
      'createdAt': post.createdAt.toIso8601String(),
    }).toList();
    await box.put('cached_posts', postsMap);
  }

  Future<List<OutputEntity>> getCachedPosts() async {
    final box = await Hive.openBox(_boxName);
    final cached = box.get('cached_posts');
    if (cached == null) return [];
    return (cached as List).map((item) => OutputEntity(
      id: item['id'],
      uid: item['uid'],
      body: item['body'],
      imageUrl: item['imageUrl'],
      createdAt: DateTime.parse(item['createdAt']),
    )).toList();
  }
}