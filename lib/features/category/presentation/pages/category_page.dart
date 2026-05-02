import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/category/presentation/bloc/category_bloc.dart';
import 'package:makanek/features/category/presentation/widgets/category.dart';

class CategoryPage  extends StatelessWidget {
  const CategoryPage({super.key});


  @override
  Widget build(BuildContext context)
  {
  return BlocProvider(create: (_) => getIt<CategoryBloc>()..add(const OnInit()),
  child:
  BlocBuilder<CategoryBloc, CategoryState>(
  builder: (context, state) {
    if (state is InitCategory) {
      return SizedBox();
    } else if (state is SuccessCategory) {
      return Category(categories: state.categoryEntity);
    } else if (state is ErrorCategory) {
      return Text(state.message);
    }

    return CircularProgressIndicator();
  },
));
  }
}