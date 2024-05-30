import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:skill_trade/state_managment/auth/auth_bloc.dart';
import 'package:skill_trade/state_managment/auth/auth_event.dart';
import 'package:skill_trade/state_managment/auth/auth_state.dart';
import 'package:skill_trade/storage.dart';

// Mock dependencies
class MockSecureStorage extends Mock implements SecureStorage {}
class MockHttpClient extends Mock implements http.Client {}

void main() {
  late AuthBloc authBloc;
  late MockSecureStorage mockSecureStorage;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockSecureStorage = MockSecureStorage();
    mockHttpClient = MockHttpClient();
    authBloc = AuthBloc();
    authBloc.storage = mockSecureStorage;
    authBloc.client = mockHttpClient;
  });

  group('AuthBloc Tests', () {
    blocTest<AuthBloc, AuthState>(
      'emits [UnLogged] when AutomaticLogIn is added and no token is found',
      build: () {
        when(mockSecureStorage.read('token')).thenAnswer((_) async => null);
        return authBloc;
      },
      act: (bloc) => bloc.add(AutomaticLogIn()),
      expect: () => [UnLogged()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [LoggedIn] when AutomaticLogIn is added and token is found',
      build: () {
        when(mockSecureStorage.read('token')).thenAnswer((_) async => 'fakeToken');
        when(mockSecureStorage.read('role')).thenAnswer((_) async => 'customer');
        return authBloc;
      },
      act: (bloc) => bloc.add(AutomaticLogIn()),
      expect: () => [LoggedIn(role: 'customer')],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [LoggedIn] when LogInEvent is added and login is successful',
      build: () {
        when(mockSecureStorage.read('endpoint')).thenAnswer((_) async => 'localhost');
        when(mockHttpClient.post(
          Uri.parse('http://localhost:9000/trader/signin'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        )).thenAnswer((_) async => http.Response('{"access_token": "fakeToken", "role": "customer", "userId": 1}', 201));

        return authBloc;
      },
      act: (bloc) => bloc.add(LogInEvent(role: 'customer', email: 'test@example.com', password: 'password')),
      expect: () => [LoggedIn(role: 'customer')],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthError] when LogInEvent is added and login fails',
      build: () {
        when(mockSecureStorage.read('endpoint')).thenAnswer((_) async => 'localhost');
        when(mockHttpClient.post(
          Uri.parse('http://localhost:9000/trader/signin'),
          headers: anyNamed('headers'),
          body: anyNamed('body'),
        )).thenAnswer((_) async => http.Response('{"error": "invalid_credentials"}', 400));

        return authBloc;
      },
      act: (bloc) => bloc.add(LogInEvent(role: 'customer', email: 'test@example.com', password: 'password')),
      expect: () => [AuthError('Error logging user')],
    );

    // Additional tests for SignUpCustomer, SignUpTechnician, and UnlogEvent can be added in a similar manner.
  });
}
