import 'package:flutter/material.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_output.dart';
import 'package:makanek/features/getcomments/presentation/widget/comment_bubble.dart';

class GetcommentLayout extends StatelessWidget {
  final List<CommentOutput> comments;
  const GetcommentLayout({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        return CommentBubble(comment: comment);
      },
    );
  }
}