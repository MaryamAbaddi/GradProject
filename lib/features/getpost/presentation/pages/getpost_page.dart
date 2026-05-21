


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/connectivity/cubit/connectivity_cubit.dart';
import 'package:makanek/core/connectivity/cubit/connectivity_state.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getpost/presentation/bloc/getpost_bloc.dart';
import 'package:makanek/features/getpost/presentation/widget/getpost_layout.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isOffline = context.read<ConnectivityCubit>().state 
        is ConnectivityDisconnected;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetpostBloc>()
            ..add(GetPostsFetched(isOffline: isOffline)),
        ),
        BlocProvider(
          create: (_) => getIt<AvatarCubit>()..getAvatar(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 90,
          titleSpacing: 50,
          leading:  Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () =>  Navigator.pushReplacementNamed(context, AppRoutes.main),
            child: Row(children: [
              Icon(Icons.arrow_back_ios, color: colors.primary),
              AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),
            ]),
          ),
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

            if (state is DeletePostLoading ||
                state is DeletePostSuccess ||
                state is EditPostLoading ||
                state is EditPostSuccess) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}