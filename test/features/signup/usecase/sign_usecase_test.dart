import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/features/signup/domain/signup_repository/signup_repo.dart';
import 'package:mocktail/mocktail.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';
import 'package:makanek/features/signup/domain/signup_usecase/signup_usecase.dart';

class MockSignupRepo extends Mock implements SignupRepo {}

void main() {
  late SignupUsecase useCase;
  late MockSignupRepo repo;

  setUp(() {
    repo = MockSignupRepo();
    useCase = SignupUsecase(repo: repo);
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

  test('should call repo and return SignupOutEntity on success', () async {
    when(() => repo.signUp(input)).thenAnswer((_) async => output);
    final result = await useCase(input);
    expect(result, output);
    verify(() => repo.signUp(input)).called(1);
  });

  test('should throw exception when repo fails', () async {
    when(() => repo.signUp(input)).thenThrow(Exception('error'));
    expect(() => useCase(input), throwsException);
  });
}