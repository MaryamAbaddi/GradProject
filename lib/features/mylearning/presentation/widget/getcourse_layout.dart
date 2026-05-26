




import 'package:flutter/material.dart';
import 'package:makanek/features/mylearning/domain/entity/getcourses_output.dart';

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
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Image.asset(
              course.imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            title: Text(
              course.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}