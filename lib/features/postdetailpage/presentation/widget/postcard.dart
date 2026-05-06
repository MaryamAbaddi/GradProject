




import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/getname/presentation/pages/getname.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:timeago/timeago.dart' as timeago;

class PostCard extends StatelessWidget {
    final OutputEntity post;
      final AvatarEntity? avatarState;

    const PostCard({super.key,required this.post,
    required this.avatarState});

    @override 
    Widget build(BuildContext context)
    {
          final colors = Theme.of(context).colorScheme;

     return Card(
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero,
              side: BorderSide(color:const Color.fromARGB(255, 226, 223, 223))
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: colors.primary,
                          child: Text(
                            avatarState?.initial ?? '?',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Getname(
                              showHi: false,
                              fontWeight: FontWeight.bold,
                              textSize: 16,
                              textColor: colors.primary,
                            ),
                            AppText(text: timeago.format(post.createdAt)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AppText(
                            text: post.body,
                            fontWeight: FontWeight.w400,
                            textSize: 14,
                            textAlign: TextAlign.start,
                            textColor: colors.onSurface.withValues(alpha: 0.7),
                          ),
                        ),
                        if (post.imageUrl != null && post.imageUrl!.trim().isNotEmpty) ...[
                          const SizedBox(width: 8),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CachedNetworkImage(
                              imageUrl: post.imageUrl!.trim(),
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              memCacheHeight: 200,
                              memCacheWidth: 200,
                              fadeInDuration: Duration.zero,
                              fadeOutDuration: Duration.zero,
                              placeholder: (context, url) => const SizedBox(
                                height: 80,
                                width: 80,
                                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              ),
                              errorWidget: (context, url, error) => Container(
                                height: 80,
                                width: 80,
                                color: Colors.grey.shade200,
                                child: const Icon(Icons.broken_image),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    ],
                  ),
                ),
              );
    }



}