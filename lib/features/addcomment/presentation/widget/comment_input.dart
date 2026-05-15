




import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/features/addcomment/domain/entity/addcomment_input.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_bloc.dart';
import 'package:makanek/features/addcomment/presentation/bloc/addcomment_events.dart' show CommentSubmitted;




class CommentInput extends StatefulWidget {
  final String postId;
  const CommentInput({super.key, required this.postId});

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState  extends State<CommentInput>{

  final TextEditingController _controller = TextEditingController();


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context)
  {
    final colors = Theme.of(context).colorScheme;
    return  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  child:
    Row( 
    children: [
      Expanded( 
        child:
        TextField(
          controller: _controller ,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(201, 236, 236, 236),
            hintText: 'Write a comment...',
            hintStyle:TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide:  BorderSide.none
            ),
            suffixIcon: IconButton(onPressed: () {
            if (_controller.text.trim().isEmpty) return;
            final userId = FirebaseAuth.instance.currentUser!.uid;
            context.read<AddcommentBloc>().add(
              CommentSubmitted(
                commentInput: AddcommentInput(
                  postId: widget.postId,
                  userId: userId,
                  comment: _controller.text.trim(),
                ),
              ),
            );
            _controller.clear();
          },
              icon: Icon(Icons.send,color: colors.primary,))
              )
            )  
          )
     ]));
  }
}