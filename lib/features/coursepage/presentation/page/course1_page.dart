import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/coursepage/presentation/bloc/course1_bloc.dart';
import 'package:makanek/features/coursepage/presentation/bloc/course1_events.dart';
import 'package:makanek/features/coursepage/presentation/bloc/course1_state.dart';
import 'package:makanek/features/coursepage/presentation/widget/course1layout.dart';


class Course1Page extends StatelessWidget {
  const Course1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => getIt<Course1Bloc>()..add(LoadCourse1Event()),
        child: BlocBuilder<Course1Bloc, Course1State>(
          builder: (context, state) {
            if (state is Course1Loaded) {
              return Course1layout(courses: state.courses,);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}