import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:makanek/features/signup/presentation/widgets/signup_form.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<SignUpBloc>(),
      child: Scaffold(
        backgroundColor: colors.surface,
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: BlocConsumer<SignUpBloc, SignupState>(
            listener: (context, state) {
              if (state is SignupSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.verify);
              }
              if (state is SignupError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is SignupLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: colors.primary,
                  ),
                );
              }
              return SignUpForm();
            },
          ),
        ),
      ),
    );
  }
}