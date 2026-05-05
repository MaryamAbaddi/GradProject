import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/core/injection/core_injection.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/presentation/cubit/avatar_cubit.dart';

class AvatarWidget extends StatelessWidget {
  final double? raduis;
  final double? fontSize;

  const AvatarWidget({
    super.key,
    required this.raduis,
    required this.fontSize,
  });

  Color getAvatarColor(String name) {
    final hash = name.codeUnits.fold(0, (prev, e) => prev + e);
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
    ];
    return colors[hash % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AvatarCubit>()..getAvatar(),
      child: BlocBuilder<AvatarCubit, AvatarEntity?>(
        builder: (context, state) {
          final initial = state?.initial ?? '?';

          return CircleAvatar(
            radius: raduis ?? 25,
            backgroundColor: getAvatarColor(initial),
            child: Text(
              initial,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: fontSize ?? 20,
              ),
            ),
          );
        },
      ),
    );
  }
}