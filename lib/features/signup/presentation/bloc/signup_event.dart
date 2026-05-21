part of 'signup_bloc.dart';



abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupSubmit extends SignupEvent{
  final String uid;
  final String username;
  final String email;
  final String password;

  const SignupSubmit({
    required this.username,
     required this.password,
     required this.email, required this.uid
  });

  @override
  List<Object?> get props => [username, password];
}

