


import 'package:makanek/features/login/domain/entities.dart';

abstract class LoginRepo{

    Future<LoginOutputEntity> getLoginConfirm(LoginInputEntity input);
}