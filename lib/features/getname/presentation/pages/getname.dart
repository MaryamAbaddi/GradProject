


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/core/utils/shared/reusable/app_text.dart';
import 'package:makanek/features/getname/presentation/bloc/getname_bloc.dart';

class Getname extends StatelessWidget{
  final bool showHi;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  const Getname({super.key, required this.showHi,
   this.textSize,
    this.fontWeight,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (_) => getIt<GetnameBloc>()..add(const GetnameFetched()),
      child: BlocBuilder<GetnameBloc, GetnameState>(
        builder: (context, state) {
          if (state is GetnameLoading) {
            return const CircularProgressIndicator();
          }
          if (state is GetnameSuccess) {
            return AppText(
              text: showHi ? 'Hi, ${state.user.name}' : state.user.name,
              fontWeight: fontWeight,
              textSize: textSize,
              textColor: textColor
            );
          }
           return AppText(
              text: 'Hi, user',
              fontWeight: FontWeight.bold,
              textSize: 28,
              textColor: colors.onSurface);
        }
      )
    );
  }
}