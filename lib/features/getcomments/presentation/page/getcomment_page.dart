


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_bloc.dart';
import 'package:makanek/features/getcomments/presentation/bloc/getcomment_states.dart';
import 'package:makanek/features/getcomments/presentation/widget/getcomment_layout.dart';

class GetcommentPage extends StatelessWidget {
  final String postId;
  const GetcommentPage({super.key, required this.postId});

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
          return GetcommentLayout( comments: state.comments);
        }
          return SizedBox();
        }
        
        );
}}