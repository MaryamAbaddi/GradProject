import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:makanek/features/login/domain/entities.dart';
import 'package:makanek/features/login/domain/usecase.dart';

part 'login_state.dart';
part 'login_events.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc({required this.loginUseCase}) : super(const LoginInitial()) {
    on<LoginSubmit>((event, emit) async {
      emit(const LoginLoading());
      try {
        final result = await loginUseCase(  
          LoginInputEntity(
            email: event.username,
            password: event.password,
          ),
        );
        emit(LoginSuccess(loginEntity: result));
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}