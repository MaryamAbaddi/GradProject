




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/notification/notification_service.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_bloc.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_state.dart';
import 'package:makanek/features/addcomment/presentation/widget/comment_input.dart';

class AddcommentPopuppage extends StatelessWidget {
  final String postId;
  const AddcommentPopuppage({required this.postId,super.key});

  @override 
  Widget build (BuildContext context)
  {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => getIt<AddcommentBloc>(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddcommentBloc, AddcommentState>(
          listener: (context, state) {
            if (state is CommentSuccess) {
              NotificationService.showNotification(
              title: 'post Published',
              body: 'Your post was added successfully! ');
              Navigator.pop(context);
            }

            if (state is CommentError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is CommentLoading) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }
            return  CommentInput(postId: postId,);
          },
        ),
      ),
    );
  }
}