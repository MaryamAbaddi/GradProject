import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/routes/routes.dart';
import 'package:makanek/core/utils/shared/reusable/lib1.dart';
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
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 90,
            titleSpacing: 0,
            leading: GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.main),
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: colors.primary, size: 18),
                    AppText(
                      text: 'Back',
                      fontWeight: FontWeight.bold,
                      textColor: colors.primary,
                      textSize: 18,
                    ),])))),
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


