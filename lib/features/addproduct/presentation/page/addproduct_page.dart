import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/notification/notification_service.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_bloc.dart';
import 'package:makanek/features/addproduct/presentation/bloc/addproduct_state.dart';
import 'package:makanek/features/addproduct/presentation/widget/addproduct_layour.dart';

class AddproductBottomSheet extends StatelessWidget {
  const AddproductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (_) => getIt<AddproductBloc>(),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: BlocConsumer<AddproductBloc, AddproductState>(
          listener: (context, state) {
            if (state is AddproductSuccess) {
              NotificationService.showNotification(
              title: 'Product Published',
              body: 'Your Product was added successfully! ');
              if (context.mounted) {  
                      
    }
            }

            if (state is AddproductError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            if (state is AddproductLoading) {
              return Center(
                child:  CircularProgressIndicator(color: colors.primary),
              );
            }
            return const AddProductForm();
          },
        ),
      ),
    );
  }
}