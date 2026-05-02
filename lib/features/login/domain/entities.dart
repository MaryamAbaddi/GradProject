



class LoginInputEntity{
  final String email;
  final String password;
  const LoginInputEntity({required this.email,required this.password});
}

class LoginOutputEntity{
  final String uid;
  final String email;
  const LoginOutputEntity({required this.uid,required this.email});
}