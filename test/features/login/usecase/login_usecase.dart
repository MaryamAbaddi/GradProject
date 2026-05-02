import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/features/login/domain/entities.dart';
import 'package:makanek/features/login/domain/repository.dart';
import 'package:makanek/features/login/domain/usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginRepo extends Mock implements LoginRepo {}

void main() {
  late LoginUseCase useCase;
  late MockLoginRepo mockRepo;

  setUp(() {
    mockRepo = MockLoginRepo();
    useCase = LoginUseCase(repo: mockRepo);
  });

  const input = LoginInputEntity(email: 'test@test.com', password: '123456');
  const output = LoginOutputEntity(uid: '123', email: 'test@test.com');

  test('should call repo and return LoginOutputEntity on success', () async {
    when(() => mockRepo.getLoginConfirm(input)).thenAnswer((_) async => output);
    final result = await useCase(input);
    expect(result, output);
    verify(() => mockRepo.getLoginConfirm(input)).called(1);
  });

  test('should throw exception when repo fails', () async {
    when(() => mockRepo.getLoginConfirm(input)).thenThrow(Exception('error'));
    expect(() => useCase(input), throwsException);
  });
}


