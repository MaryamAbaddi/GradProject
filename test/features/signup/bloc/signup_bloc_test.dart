import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_in_entities.dart';
import 'package:makanek/features/signup/domain/signup_entites/signup_out_entity.dart';
import 'package:makanek/features/signup/domain/signup_usecase/signup_usecase.dart';
import 'package:makanek/features/signup/presentation/bloc/signup_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSignupUsecase extends Mock implements SignupUsecase {}

void main() {
  late MockSignupUsecase mockUseCase;

  setUpAll(() {
    registerFallbackValue( SignUpEntity(email: '', password: '', username: ''));
  });

  setUp(() {
    mockUseCase = MockSignupUsecase();
  });

  final output = SignupOutEntity(uid: '123', email: 'test@test.com');

  test('initial state should be SignupInitial', () {
    final bloc = SignUpBloc(signupUsecase: mockUseCase);
    expect(bloc.state, const SignupInitial());
    bloc.close();
  });

  blocTest<SignUpBloc, SignupState>(
    'should emit [SignupLoading, SignupSuccess] when signup succeeds',
    build: () {
      when(() => mockUseCase(any())).thenAnswer((_) async => output); // ← was missing
      return SignUpBloc(signupUsecase: mockUseCase); // ← fresh bloc
    },
    act: (bloc) => bloc.add(SignupSubmit(
      username: 'testuser',
      email: 'test@test.com',
      password: '123456',
    )),
    expect: () => [
      const SignupLoading(),
      isA<SignupSuccess>(),
    ],
  );

  blocTest<SignUpBloc, SignupState>(
    'should emit [SignupLoading, SignupError] when signup fails',
    build: () {
      when(() => mockUseCase(any())).thenThrow(Exception('error'));
      return SignUpBloc(signupUsecase: mockUseCase); // ← fresh bloc
    },
    act: (bloc) => bloc.add(SignupSubmit(
      username: 'testuser',
      email: 'test@test.com',
      password: '123456',
    )),
    expect: () => [
      const SignupLoading(),
      isA<SignupError>(),
    ],
  );
}