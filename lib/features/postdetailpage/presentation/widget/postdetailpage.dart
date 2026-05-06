import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/postdetailpage/presentation/widget/postcard.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class PostDetailPage extends StatelessWidget {
  final OutputEntity post;
  const PostDetailPage({super.key,
  required this.post});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<AvatarCubit>()..getAvatar(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
          AppText(
            text: 'Back',
            textColor: colors.primary,
            textSize:  20,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, size: 15, color: colors.primary),
          ),
        ),
        body: BlocBuilder<AvatarCubit, AvatarEntity?>(
          builder: (context, avatarState) {
            return 
              Padding(
              padding: const EdgeInsets.only(bottom:16),
              child:Column(
              children: [
                PostCard(post: post, avatarState: avatarState),
                Row(
                      children: [
                        const SizedBox(width: 8),
                        Icon(Icons.favorite_border, color: colors.primary,),
                        SizedBox(width: 14),
                        Icon(Icons.chat_bubble_outline_rounded, color: colors.primary),
                        ],
                  ),
                ],
              )
            );
          },
        ),
      ),
    );
  }
}