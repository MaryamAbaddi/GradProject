import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/productpage1/presentation/bloc/product1_bloc.dart';
import 'package:makanek/features/productpage1/presentation/bloc/product1_events.dart';
import 'package:makanek/features/productpage1/presentation/bloc/product1_state.dart';
import 'package:makanek/features/productpage1/presentation/widget/product1_layout.dart';

class Product1Page extends StatelessWidget {
  const Product1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => getIt<Product1Bloc>()..add(LoadProduct1Event()),
        child: BlocBuilder<Product1Bloc, Product1State>(
          builder: (context, state) {
            if (state is Product1Loaded) {
              return Product1Layout(products: state.products,);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}