import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_bloc.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_event.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_state.dart';
import 'package:makanek/features/mylearning/presentation/widget/getcourse_layout.dart';

class GetcoursePage extends StatelessWidget {
  const GetcoursePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<GetcourseBloc>()..add(CourseLoaded()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 90,
        titleSpacing: 50,
        title: AppText(text: 'My learning', fontWeight: FontWeight.bold, textSize: 16,textColor: colors.primary,),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: GestureDetector(
            onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
            child: Row(children: [
              Icon(Icons.arrow_back_ios, color: colors.primary),
              AppText(text: 'Back', fontWeight: FontWeight.bold, textColor: colors.primary, textSize: 16),]))),),
        body: BlocBuilder<GetcourseBloc, GetcourseState>(
          builder: (context, state) {
            if (state is GetcourseLoading) {
              return Center(child: CircularProgressIndicator(color: colors.primary));
            }
            if (state is GetcourseError) {
              return Center(child: Text(state.message));
            }
            if (state is GetcourseSuccess) {
              return GetcourseLayout(courses: state.courses);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}