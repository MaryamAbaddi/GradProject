import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/features/onboarding/presentation/bloc/onboard_bloc.dart';
import 'package:makanek/features/onboarding/presentation/widgets/layout.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late final PageController controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colors.surface,
      body: BlocProvider(
        create: (_) => getIt<OnboardBloc>()..add(const OnboardStarted()),
        child: BlocConsumer<OnboardBloc, OnboardState>(
          listener: (context, state) async {
            if (state is OnboardingPageChanged) {
              currentIndex = state.pageIndex;
              controller.animateToPage(
                state.pageIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.fastOutSlowIn,
              );
            }
                      if (state is OnboardingSuccess) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setBool('seen_onboarding', true); 
            if (!mounted) return;
            Navigator.pushReplacementNamed(context, AppRoutes.welcome); // use replacement
          }
          },
          buildWhen: (previous, current) => current is OnboardingLoaded,
          builder: (context, state) {
            if (state is OnboardingLoaded) {
              return PageView.builder(
                controller: controller,
                itemCount: state.entity.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return OnbordLayout(
                    page: state.entity[index],
                    onNext: () => context.read<OnboardBloc>().add(
                      OnboardingNext(currentPage: index),
                    ),
                  );
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}