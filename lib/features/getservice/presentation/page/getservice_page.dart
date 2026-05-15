import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
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
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 90,
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
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
        floatingActionButton:Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05,), child:
              FloatingActionButton(
                onPressed: () {
                },
          backgroundColor: colors.primary,
          shape:CircleBorder(),
          child: const Icon(Icons.add, color: Colors.white),
        ),),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        body: BlocConsumer<GetserviceBloc, GetserviceState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingGetService) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }
            if (state is SuccessGetService) {
              return GetserviceLayout(services: state.services);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}