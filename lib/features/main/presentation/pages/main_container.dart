import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getpost/presentation/pages/getpost_page.dart';
import 'package:makanek/features/home/presentation/widgets/homepage_layout.dart';
import 'package:makanek/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:makanek/features/main/presentation/widgets/navigationbar.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigateCubit(), // ← this was missing
      child: BlocBuilder<NavigateCubit, int>(
        builder: (context, navState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: navState == 0 ? const HomePage() // Home
                : navState == 1 ? const CommunityPage() // Community
                : navState == 2 ? const Placeholder() // Purchases
                : const Placeholder(), // Cart
            bottomNavigationBar: AppNavigationBar(
              currentIndex: navState,
              onTap: (value) => context.read<NavigateCubit>().setActiveID(value),
            ),
          );
        },
      ),
    );
  }
}