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

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BlocProvider(create: (_) => getIt<AvatarCubit>()..getAvatar(),
    child:BlocBuilder<AvatarCubit, AvatarEntity?>(
      builder: (context, state) {
        final initial = state?.initial;

        return CircleAvatar(
          radius: raduis ?? 25,
          backgroundColor: colors.primary,
          child: Text(
            (initial != null && initial.isNotEmpty)
                ? initial
                : '?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: fontSize ?? 20,
            ),
          ),
        );
      },
    )
    );
  }
}