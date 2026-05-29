  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:makanek/core/injection/core_injection.dart';
  import 'package:makanek/core/utils/shared/reusable/app_text.dart';
  import 'package:makanek/features/addcomment/presentation/bloc/addcomment_bloc.dart';
  import 'package:makanek/features/addcomment/presentation/page/addcomment_popuppage.dart';
  import 'package:makanek/features/addcomment/presentation/widget/comment_input.dart';
  import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
  import 'package:makanek/features/getcomments/presentation/page/getcomment_page.dart';
  import 'package:makanek/features/postdetailpage/presentation/widget/postcard.dart';
  import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
  import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

  class PostDetailPage extends StatelessWidget {
    final OutputEntity post;
    const PostDetailPage({super.key, required this.post});

    @override
    Widget build(BuildContext context) {
      final colors = Theme.of(context).colorScheme;
      return BlocProvider(
        create: (_) => getIt<AvatarCubit>()..getAvatar(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 90,
            titleSpacing: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: colors.primary, size: 18),
                    AppText(
                      text: 'Back',
                      fontWeight: FontWeight.bold,
                      textColor: colors.primary,
                      textSize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: BlocBuilder<AvatarCubit, AvatarEntity?>(
            builder: (context, avatarState) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    PostCard(post: post, avatarState: avatarState),
                    Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.favorite_border, color: colors.primary),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.chat_bubble_outline_rounded, color: colors.primary),
                          onPressed: () => showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (_) => AddcommentPopuppage(postId: post.id),
                          ),
                        ),
                      ],
                    ),
                        Expanded(
                      child: GetcommentPage(postId: post.id),
      ),
                    BlocProvider(
                      create: (_) => getIt<AddcommentBloc>(),
                      child:Column(children: [
                      Divider(thickness: 0.5, color: colors.onSurface.withValues(alpha: 0.4)),
                      CommentInput(postId: post.id),]
                    ),
                )],
                ),
              );
            },
          ),
        ),
      );
    }
  }