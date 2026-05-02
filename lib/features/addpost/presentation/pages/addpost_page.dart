import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/addpost/presentation/bloc/addpost_bloc.dart';
import 'package:makanek/features/addpost/presentation/widget/addpost_layout.dart';

class AddPostBottomSheet extends StatelessWidget {
  const AddPostBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => getIt<AddpostBloc>(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddpostBloc, AddpostState>(
          listener: (context, state) {
            if (state is AddpostSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Post added successfully!')),
              );
              Navigator.pop(context);
            }

            if (state is AddpostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AddpostLoading) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }
            return const AddPostForm();
          },
        ),
      ),
    );
  }
}