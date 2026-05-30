




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/utils/responisve_utils.dart';
import 'package:makanek/core/utils/shared/Inpages/lib1.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_bloc.dart';
import 'package:makanek/features/mylearning/presentation/bloc/getcourse_event.dart';

class GetcourseLayout extends StatelessWidget {
  final List<GetcoursesOutput> courses;

  const GetcourseLayout({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (courses.isEmpty) {
      return const Center(child: Text('No courses enrolled yet'));
    }

   return ListView.builder(
  itemCount: courses.length,
  itemBuilder: (context, index) {
    final course = courses[index];
    return Container(
      width: context.horizontal,
      height: context.vertical*2,
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color.fromARGB(255, 219, 219, 219), width: 1),
      ),
      child: Padding(padding: EdgeInsets.all(16),child:
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[Image.asset(
          course.imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        SizedBox(width: context.horizontal/2,),
        AppText(
            text: course.title,
            fontWeight: FontWeight.bold,
            textColor: colors.primary,
          ),
          Spacer(),
          Button(onPressed: (){
            context.read<GetcourseBloc>().add(DeleteCoure(title: course.title));
          },
            isText: true,textColor: colors.primary, borderRadius: 0, fontSize: 10, text: "Unenroll", buttonWidth: 0, buttonHeight: 0, fontWeight: FontWeight.bold, elevation: 0)
          ]
        ),
      ));
  });
  }
}

