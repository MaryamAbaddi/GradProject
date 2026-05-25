



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/forgetpassword/domain/entity/forgetpassword_input.dart';
import 'package:makanek/features/forgetpassword/domain/usecase/forgetpassword_usecase.dart';

class ForgetpasswordCubit extends Cubit<void> {
  final ForgetpasswordUsecase usecase;

  ForgetpasswordCubit({required this.usecase}) : super(null);

  Future<void> forgetPassword(String email) async {
    await usecase.calls(ForgetpasswordInput(email: email));
}
}