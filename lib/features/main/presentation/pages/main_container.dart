import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/getcartitems/presentation/page/getcartitems_page.dart';
import 'package:makanek/features/getpost/presentation/pages/getpost_page.dart';
import 'package:makanek/features/getpurchases/presentation/page/getpurchases_page.dart';
import 'package:makanek/features/home/presentation/widgets/homepage_layout.dart';
import 'package:makanek/features/main/presentation/cubit/navigation_cubit.dart';
import 'package:makanek/features/main/presentation/widgets/navigationbar.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigateCubit(), 
      child: BlocBuilder<NavigateCubit, int>(
        builder: (context, navState) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: navState == 0 ? const HomePage() 
                : navState == 1 ? const CommunityPage() 
                : navState == 2 ? const GetpurchasesPage()
                : const GetcartitemsPage(), 
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