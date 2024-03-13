part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class Authenticate extends AuthEvent {
  final String username, password;

  Authenticate({required this.username, required this.password});
}
