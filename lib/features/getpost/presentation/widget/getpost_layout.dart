import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/addpost/presentation/pages/addpost_page.dart';
import 'package:makanek/features/getname/presentation/pages/getname.dart';
import 'package:makanek/features/getpost/presentation/bloc/getpost_bloc.dart';
import 'package:makanek/features/postdetailpage/presentation/widget/postdetailpage.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';
import 'package:makanek/features/profileavatar/presentation/widget/avatar.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

class CommunityLayout extends StatelessWidget {
  final List<OutputEntity> posts;

  const CommunityLayout({
    super.key,
    required this.posts,
  });

  void _showAddPostDialog(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) => AlertDialog(
        scrollable: true,
        titlePadding: const EdgeInsets.fromLTRB(2, 2, 2, 0),
        contentPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 120),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => Navigator.of(dialogContext, rootNavigator: true).pop(),
              icon: Icon(Icons.close, color: colors.onSurface, size: 16),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTitle(
                  size: 20,
                  title: 'Add new post',
                  weight: FontWeight.w400,
                  titleColor: colors.primary,
                  textAlign: TextAlign.left,
                ),
                SizedBox(width: context.spacer * 3.5),
                 AvatarWidget(raduis: 18, fontSize: 16),
              ],
            ),
            Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.1)),
          ],
        ),
        content: const SizedBox(
          height: 300,
          width: double.maxFinite,
          child: AddPostBottomSheet(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocBuilder<AvatarCubit, AvatarEntity?>(
      builder: (context, avatarState) {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          cacheExtent: 500,
          itemCount: posts.length + 1,
          itemBuilder: (context, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitle(
                    size: 35,
                      title: 'Community',
                      weight: FontWeight.bold,
                      titleColor: colors.primary,
                      textAlign: TextAlign.start,
                    ),
                    IconButton(
                      icon: Icon(Icons.add_circle_rounded, color: colors.primary,size:50),
                      onPressed: () => _showAddPostDialog(context),
                    ),
                  ],
                ),
              );
            }

            final post = posts[index - 1];

            return GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetailPage(post: post),
                ),
              ),
            child:
             Card(
              key: ValueKey(index),
              color: Colors.white,
              margin: const EdgeInsets.only(bottom: 12),
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: colors.primary, width: 1)
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
                        Row(children:[
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
                            const Spacer(),
                            if(post.uid == FirebaseAuth.instance.currentUser?.uid)
                            PopupMenuButton<String>(icon: Icon(Icons.more_vert,color: Colors.black,),
                            onSelected: (value){
                              if(value == 'delete')
                              {
                                context.read<GetpostBloc>().add(DeletePostEvent(postId: post.id));
                              }
                            }


                            ,itemBuilder: (_) => [
                            PopupMenuItem(value:'delete',child: Text('delete')),
                            PopupMenuItem(value:'edit',child: Text('edit')),

                          ],)
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
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.favorite_border, color: colors.onSurface),
                        const SizedBox(width: 16),
                        Icon(Icons.comment_outlined, color: colors.onSurface),
                          ],
                        ),
                      ],
                    ),
                  ]
                ),
               )
              )
            );
          },
        );
      },
    );
  }
}