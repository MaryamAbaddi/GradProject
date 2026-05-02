import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/features/login/data/login_repo_imp.dart';
import 'package:makanek/features/login/data/remote_data_source_imp.dart';
import 'package:makanek/features/login/domain/entities.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements RemoteDataSourceImp {}

void main() {
  late LoginRepoImp repo;
  late MockRemoteDataSource mockDataSource;

  setUp(() {
    mockDataSource = MockRemoteDataSource();
    repo = LoginRepoImp(remoteDataSource: mockDataSource);
  });

  const input = LoginInputEntity(email: 'test@test.com', password: '123456');
  const output = LoginOutputEntity(uid: '123', email: 'test@test.com');

  test('should return LoginOutputEntity from the REAL repo', () async {
    when(() => mockDataSource.login(input)).thenAnswer((_) async => output);

    final result = await repo.getLoginConfirm(input); // ← fixed method name

    expect(result, output);
    verify(() => mockDataSource.login(input)).called(1);
  });

  test('should propagate exception from the REAL repo', () async {
    when(() => mockDataSource.login(input)).thenThrow(Exception('error'));

    expect(() => repo.getLoginConfirm(input), throwsException); // ← fixed method name
  });
}