import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_bloc.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_event.dart';
import 'package:makanek/features/getproduct/presentation/bloc/getproduct_state.dart';
import 'package:makanek/features/getproduct/presentation/widget/getproduct_layout.dart';

class GetproductPage extends StatelessWidget {
      final String? highlightId;
  const GetproductPage({super.key, this.highlightId});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return 
        BlocProvider(
          create: (_) => getIt<GetproductBloc>()..add(GetproductFetched()),        
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 90,
            titleSpacing: 50,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: GestureDetector(
                onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
                child: Row(children: [
                  Icon(Icons.arrow_back_ios, color: colors.primary),
                  AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),
                ]),
              ),
            ),
          ),
          body: BlocConsumer<GetproductBloc, GetproductState>(
            listener: (context, state) {
              if (state is GetproductError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is GetproductLoading) {
                return Center(child: CircularProgressIndicator(color: colors.primary));
              }
              if (state is GetproductSuccess) {
                return ProductsLayout(products: state.product,highlightId: highlightId,);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}