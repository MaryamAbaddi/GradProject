



part of 'signup_bloc.dart';

abstract class SignupState extends Equatable{

  const SignupState();
  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState{
  const SignupInitial();
}
class SignupLoading extends SignupState{
  const SignupLoading();
}

class SignupSuccess extends SignupState {
  final SignupOutEntity signupOutEntity;
  const SignupSuccess({required this.signupOutEntity});
  @override
  List<Object?> get props => [signupOutEntity];
}
class SignupError extends SignupState{
  final String message;
  const SignupError(this.message);
   @override
  List<Object?> get props => [message];
}