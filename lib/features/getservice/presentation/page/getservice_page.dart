import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_bloc.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_events.dart';
import 'package:makanek/features/getservice/presentation/bloc/getservice_state.dart';
import 'package:makanek/features/getservice/presentation/widget/getservice_layout.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class GetservicePage extends StatelessWidget {
  const GetservicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<GetserviceBloc>()..add(GetServiceDataFetch()),
        ),
        BlocProvider(
          create: (_) => getIt<AvatarCubit>()..getAvatar(),
        ),
      ],
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 90,
            titleSpacing: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: colors.primary, size: 18),
                    AppText(
                      text: 'Back',
                      fontWeight: FontWeight.bold,
                      textColor: colors.primary,
                      textSize: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: BlocConsumer<GetserviceBloc, GetserviceState>(
            listener: (context, state) {
              if (state is ErrorGetService) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is LoadingGetService) {
                return Center(
                  child: CircularProgressIndicator(color: colors.primary),
                );
              }
              if (state is SuccessGetService) {
                return ServicesLayout(services: state.services);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}