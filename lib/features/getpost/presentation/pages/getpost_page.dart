import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/features/getpost/presentation/bloc/getpost_bloc.dart';
import 'package:makanek/features/getpost/presentation/widget/getpost_layout.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<GetpostBloc>()..add(const GetPostsFetched()),
        ),
        BlocProvider(
          create: (_) => getIt<AvatarCubit>()..getAvatar(),
        ),
      ],
      child: Scaffold(
        backgroundColor: colors.surface,
        appBar: AppBar(
          backgroundColor: colors.surface,
          title: AppTitle(
            title: 'Back',
            size: 20,
            weight: FontWeight.bold,
            titleColor: colors.onSurface,
            textAlign: null,
          ),
        ),
        body: BlocConsumer<GetpostBloc, GetpostState>(
          listener: (context, state) {
            if (state is GetpostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is GetpostLoading) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }

            if (state is GetpostSuccess) {
              return CommunityLayout(posts: state.posts);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}