import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';

import 'package:makanek/features/servicepage1/presentation/bloc/service1_bloc.dart';
import 'package:makanek/features/servicepage1/presentation/bloc/service1_events.dart';
import 'package:makanek/features/servicepage1/presentation/bloc/service1_state.dart';
import 'package:makanek/features/servicepage1/presentation/widget/service1layout.dart';

class Service1Page extends StatelessWidget {
  const Service1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => getIt<Service1Bloc>()..add(LoadService1Event()),
        child: BlocBuilder<Service1Bloc, Service1State>(
          builder: (context, state) {
            if (state is Service1Loaded) {
              return Service1layout(services: state.services,);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}