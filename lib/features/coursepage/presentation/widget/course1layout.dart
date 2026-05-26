import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_card.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/addcourses/presentation/cubit/addcourse_cubit.dart';
import 'package:makanek/features/coursepage/domain/entity/course1_entity.dart';

class Course1layout extends StatelessWidget {
  final List<Course1Entity> courses;
  const Course1layout({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
   return BlocProvider(
      create: (_) => getIt<AddCourseCubit>(),
      child: Builder(
    builder: (context) => Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: AppText(text: 'Back', textColor: colors.primary, textSize: 16, fontWeight: FontWeight.bold),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 15, color: colors.primary),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 40, bottom:7 ),
            child: AppTitle(
              size: 35,
              title: 'Courses',
              weight: FontWeight.bold,
              titleColor: colors.primary,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(child:ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final Course1Entity course = courses[index];
              return AppCard(
                flag:true,
                onEnroll: ()
                {
                  context.read<AddCourseCubit>().addCourse(course.title, course.imagePath);
                },
                title: course.title,
                body: course.body,
                imagePath: course.imagePath,
              );
            },
          ),
      )],
      ),
    )));
  }
} 


