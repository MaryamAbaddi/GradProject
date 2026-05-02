import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/features/login/presentation/bloc/login_bloc.dart';
import 'package:makanek/features/login/presentation/widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create:  (_) => getIt<LoginBloc>(),
      child: Scaffold(
        backgroundColor: colors.surface,
        body: SizedBox(
          width: context.screenWidth,
          height: context.screenHeight,
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.main);
              }
              if (state is LoginError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(
                  child: CircularProgressIndicator(color: colors.primary),
                );
              }
              return LoginForm();
            },
          ),
        ),
      ),
    );
  }
}