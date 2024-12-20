part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class Authenticated extends AuthState {
  final String token;

  Authenticated({required this.token});
}

final class AuthError extends AuthState {
  final String errorMessage;

  AuthError({required this.errorMessage});
}
