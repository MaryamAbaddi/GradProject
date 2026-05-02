import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/features/signup/data/signup_data_source/data_src_meth.dart';
import 'package:makanek/features/signup/data/signup_repo_imp.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';
import 'package:mocktail/mocktail.dart';


class MockDataSrcMeth extends Mock implements DataSrcMeth {}

void main() {
  late SignupRepoImp repo;
  late MockDataSrcMeth mockDataSource;

  setUp(() {
    mockDataSource = MockDataSrcMeth();
    repo = SignupRepoImp(dataSrc: mockDataSource);
  });

  final input = SignUpEntity(
    email: 'test@test.com',
    password: '123456',
    username: 'testuser',
  );

  final output = SignupOutEntity(
    uid: '123',
    email: 'test@test.com',
  );

  test('should return SignupOutEntity when data source succeeds', () async {
    when(() => mockDataSource.signUp(input)).thenAnswer((_) async => output);
    final result = await repo.signUp(input);
    expect(result, output);
    verify(() => mockDataSource.signUp(input)).called(1);
  });

  test('should throw exception when data source fails', () async {
    when(() => mockDataSource.signUp(input)).thenThrow(Exception('error'));
    expect(() => repo.signUp(input), throwsException);
  });
}