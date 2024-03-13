import 'package:ayurvedic/data/repo/auth/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<Authenticate>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.loginUser(
            username: event.username, password: event.password);

        final token = await authRepository.loadToken();
        if (token != null) emit(Authenticated(token: token));
      } catch (e) {
        emit(AuthError(errorMessage: '$e'));
      }
    });
  }
}
