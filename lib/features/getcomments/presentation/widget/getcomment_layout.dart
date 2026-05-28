
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_bloc.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_states.dart';
import 'package:makanek/features/getcomments/presentation/widget/comment_bubble.dart';

class GetcommentLayout extends StatelessWidget {
  final String postId;
  const GetcommentLayout({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetcommentBloc, GetcommentState>(
      builder: (context, state) {
        if (state is GetcommentLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is GetcommentError) {
          return Center(child: AppText(text: state.message));
        }
        if (state is GetcommentSuccess) {
          if (state.comments.isEmpty) {
            return const Center(child: AppText(text: 'No comments yet'));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: state.comments.length,
            itemBuilder: (context, index) {
              final comment = state.comments[index];
              return CommentBubble(comment: comment);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
