import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/profileavatar/domain/entity/avatar_entity.dart';
import 'package:makanek/features/profileavatar/domain/usecase/avatar_usecase.dart';

class AvatarCubit extends Cubit<AvatarEntity?> {
  final AvatarUsecase usecase;

  AvatarCubit({required this.usecase}) : super(null);

  Future<void> getAvatar({String? ownerId}) async {
    try {
      final result = await usecase.call(ownerId: ownerId);
      emit(result);
    } catch (e) {
      emit(AvatarEntity(initial: '?'));
    }
  }
}