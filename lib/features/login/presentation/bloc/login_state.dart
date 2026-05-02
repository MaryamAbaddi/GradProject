part of 'login_bloc.dart';




abstract class LoginState extends Equatable{

  const LoginState();
  @override
  List<Object?> get props => [];
}


class LoginInitial extends LoginState{
  const LoginInitial();
}
class LoginLoading extends LoginState{
  const LoginLoading();
}
class LoginSuccess extends LoginState{
  final LoginOutputEntity loginEntity;
  const LoginSuccess({required this.loginEntity});
  @override 
  List<Object?> get props => [loginEntity];
}

class LoginError extends LoginState{
  final String message;
  const LoginError(this.message);
   @override
  List<Object?> get props => [message];
}