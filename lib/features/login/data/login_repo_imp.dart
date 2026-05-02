



import 'package:makanek/features/login/data/remote_data_source_imp.dart';
import 'package:makanek/features/login/domain/entities.dart';
import 'package:makanek/features/login/domain/repository.dart';

class LoginRepoImp implements LoginRepo {

  final RemoteDataSourceImp remoteDataSource;
  LoginRepoImp({required this.remoteDataSource});

  @override
   Future<LoginOutputEntity> getLoginConfirm(LoginInputEntity input) async{
    return await remoteDataSource.login(input);
  }
} 