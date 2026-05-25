import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';
import 'package:makanek/features/signup/domain/signup_usecase/signup_usecase.dart';

part 'signup_state.dart';
part 'signup_event.dart';

class SignUpBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUsecase signupUsecase;

  SignUpBloc({required this.signupUsecase}) : super(const SignupInitial()) {
    on<SignupSubmit>((event, emit) async {
      emit(const SignupLoading());
      try {
        final input = SignUpEntity(
          email: event.email,
          password: event.password,
          username: event.username, uid: event.uid,
        );
        final result = await signupUsecase(input);
        await FirebaseAuth.instance.currentUser!.sendEmailVerification(); 
        emit(SignupSuccess( signupOutEntity: result));
      } catch (e) {
        emit(SignupError(e.toString()));
      }
    });
  }
}