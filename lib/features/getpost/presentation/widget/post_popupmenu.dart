import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/shared/reusable/post_dialog.dart';
import 'package:makanek/features/addpost/domain/entity/addpost_output.dart';
import 'package:makanek/features/getpost/presentation/bloc/getpost_bloc.dart';

class PostPopupMenu extends StatelessWidget {
  final OutputEntity post;

  const PostPopupMenu({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (post.uid != FirebaseAuth.instance.currentUser?.uid) {
      return const SizedBox();
    }

    return PopupMenuButton<String>(
      color: Colors.white,
      icon: Icon(Icons.more_vert, color: colors.onSurface),
      onSelected: (value) {
        if (value == 'delete') {
          context.read<GetpostBloc>().add(DeletePostEvent(postId: post.id));
        } else {
          PostDialog.showEditPost(context, post, (newBody) {
            context.read<GetpostBloc>().add(EditPostEvent(
              postId: post.id,
              newBody: newBody,
            ));
          });
        }
      },
      itemBuilder: (_) => [
        const PopupMenuItem(value: 'delete', child: Text('Delete')),
        const PopupMenuItem(value: 'edit', child: Text('Edit')),
      ],
    );
  }
}