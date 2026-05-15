import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getpost/presentation/bloc/getpost_bloc.dart';
import 'package:makanek/features/getpost/presentation/widget/getpost_layout.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_bloc.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class GetproductPage extends StatelessWidget {
  const GetproductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetproductBloc>()
            ..add(GetproductFetched()),
        ),
        BlocProvider(
          create: (_) => getIt<AvatarCubit>()..getAvatar(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: AppText(
            text: 'Back',
            textColor: colors.primary,
            textSize: 20,
            fontWeight: FontWeight.bold,
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back_ios, size: 15, color: colors.primary),
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