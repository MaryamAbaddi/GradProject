import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/features/login/domain/entities.dart';
import 'package:makanek/features/login/domain/usecase.dart';
import 'package:makanek/features/login/presentation/bloc/login_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockLoginUseCase extends Mock implements LoginUseCase {}

void main() {
  late MockLoginUseCase mockUseCase;

  setUpAll(() {
    registerFallbackValue(const LoginInputEntity(email: '', password: '')); // ← add this
  });

  setUp(() {
    mockUseCase = MockLoginUseCase();
  });

  const input = LoginInputEntity(email: 'test@test.com', password: '123456');
  const output = LoginOutputEntity(uid: '123', email: 'test@test.com');

  test('initial state should be LoginInitial', () {
    final bloc = LoginBloc(loginUseCase: mockUseCase);
    expect(bloc.state, const LoginInitial());
    bloc.close();
  });

  blocTest<LoginBloc, LoginState>(
    'should emit [LoginLoading, LoginSuccess] when login succeeds',
    build: () {
      when(() => mockUseCase(any())).thenAnswer((_) async => output); // ← any() instead of input
      return LoginBloc(loginUseCase: mockUseCase);
    },
    act: (bloc) => bloc.add(const LoginSubmit(
      username: 'test@test.com',
      password: '123456',
    )),
    expect: () => [
      const LoginLoading(),
      LoginSuccess(loginEntity: output),
    ],
  );

  blocTest<LoginBloc, LoginState>(
    'should emit [LoginLoading, LoginError] when login fails',
    build: () {
      when(() => mockUseCase(any())).thenThrow(Exception('error')); // ← any() instead of input
      return LoginBloc(loginUseCase: mockUseCase);
    },
    act: (bloc) => bloc.add(const LoginSubmit(
      username: 'test@test.com',
      password: '123456',
    )),
    expect: () => [
      const LoginLoading(),
      const LoginError('Exception: error'),
    ],
  );
}