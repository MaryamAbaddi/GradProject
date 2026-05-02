



import 'package:makanek/features/login/domain/entities.dart';

abstract class RemoteDataSouceMeth {

  Future<LoginOutputEntity> login(LoginInputEntity input);
}
