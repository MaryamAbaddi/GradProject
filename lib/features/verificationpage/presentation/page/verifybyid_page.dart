import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_bloc.dart';
import 'package:makanek/features/verificationpage/presentation/bloc/verifybyid_state.dart';
import 'package:makanek/features/verificationpage/presentation/widget/verifybyid_layout.dart';

class VerifybyidPage extends StatelessWidget {
  const VerifybyidPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<VerifybyidBloc>(),
      child: BlocConsumer<VerifybyidBloc, VerifybyidState>(
        listener: (context, state) {
          if (state is VerifybyidSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Verification submitted!')),
            );
            Navigator.pushReplacementNamed(context, AppRoutes.main);
          }
          if (state is VerifybyidError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leadingWidth: 90,
              titleSpacing: 50,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.signUp),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: colors.primary),
                      AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),
                    ],
                  ),
                ),
              ),
            ),
            body: state is VerifybyidLoading
                ? const Center(child: CircularProgressIndicator())
                : const VerifybyidLayout(),
          );
        },
      ),
    );
  }
}