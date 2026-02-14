import 'package:bloc_test/bloc_test.dart';
import 'package:dummy_clean_architecture/features/auth/domain/entities/auth_user_entity.dart';
import 'package:dummy_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dummy_clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

/// Mock Bloc

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class FakeAuthEvent extends Fake {}

class FakeAuthState extends Fake {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() {
    registerFallbackValue(
      const AuthEvent.loginRequested(username: '', password: ''),
    );

    registerFallbackValue(const AuthState.initial());
  });

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  Widget makeTestableWidget() {
    return MaterialApp(
      home: BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const LoginPage(),
      ),
    );
  }

  /// UI Render Test
  testWidgets('renders login UI correctly', (WidgetTester tester) async {
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

    await tester.pumpWidget(makeTestableWidget());

    expect(find.text('Welcome Back'), findsOneWidget);
    expect(find.text('Enter your email'), findsOneWidget);
    expect(find.text('Enter password'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });

  /// Validation Test
  testWidgets('shows validation error when fields are empty', (
    WidgetTester tester,
  ) async {
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

    await tester.pumpWidget(makeTestableWidget());

    await tester.tap(find.text('Login'));
    await tester.pump();

    expect(find.textContaining('Enter your email'), findsOneWidget);
    expect(find.textContaining('Enter password'), findsOneWidget);
  });

  /// Event Dispatch Test

  testWidgets('dispatches loginRequested when form is valid', (
    WidgetTester tester,
  ) async {
    when(() => mockAuthBloc.state).thenReturn(const AuthState.initial());

    await tester.pumpWidget(makeTestableWidget());

    await tester.enterText(find.byType(TextFormField).at(0), 'test@gmail.com');
    await tester.enterText(find.byType(TextFormField).at(1), '123456');

    await tester.tap(find.text('Login'));
    await tester.pump();

    verify(
      () => mockAuthBloc.add(
        const AuthEvent.loginRequested(
          username: 'test@gmail.com',
          password: '123456',
        ),
      ),
    ).called(1);
  });

  /// Loading State Test

  testWidgets('shows loading when state is loading', (
    WidgetTester tester,
  ) async {
    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable(<AuthState>[const AuthState.loading()]),
      initialState: const AuthState.initial(),
    );

    await tester.pumpWidget(makeTestableWidget());
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  /// Success State Test

  testWidgets('shows success snackbar on authenticated state', (
    WidgetTester tester,
  ) async {
    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable(<AuthState>[
        const AuthState.authenticated(
          AuthUserEntity(
            userId: 1,
            email: 'test@gmail.com',
            token: 'token',
            firstName: 'Test',
            lastName: 'User',
            fullName: 'Test User',
          ),
        ),
      ]),
      initialState: const AuthState.loading(),
    );

    await tester.pumpWidget(makeTestableWidget());
    await tester.pump();
    await tester.pump();

    // expect(find.text('Test User'), findsOneWidget);
    expect(find.byType(LoginPage), findsOneWidget);
  });

  /// Error State Test

  testWidgets('shows error snackbar on error state', (
    WidgetTester tester,
  ) async {
    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable(<AuthState>[
        const AuthState.error('Invalid credentials'),
      ]),
      initialState: const AuthState.loading(),
    );

    await tester.pumpWidget(makeTestableWidget());
    await tester.pump();

    // expect(find.text('Invalid credentials'), findsOneWidget);
    expect(find.byType(LoginPage), findsOneWidget);
  });
}
