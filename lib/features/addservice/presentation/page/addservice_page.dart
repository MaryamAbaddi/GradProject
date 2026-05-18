



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/notification/notification_service.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_bloc.dart';
import 'package:makanek/features/addservice/presentation/bloc/addservice_state.dart';
import 'package:makanek/features/addservice/presentation/widget/addservice_layout.dart';

class AddserviceBottomSheet extends StatelessWidget {
  const AddserviceBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => getIt<AddserviceBloc>(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddserviceBloc, AddserviceState>(
          listener: (context, state) {
            if (state is AddserviceSuccess) {
              NotificationService.showNotification(
                title: 'Service Published',
                body: 'Your service was added successfully!',
              );
              if (context.mounted) {
                Navigator.pop(context);
              }
            }

            if (state is AddserviceError) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            }
          },
          builder: (context, state) {
            if (state is AddserviceLoading) {
              return Center(
                child: CircularProgressIndicator(color: colors.primary),
              );
            }
            return const AddServiceForm();
          },
        ),
      ),
    );
  }
}