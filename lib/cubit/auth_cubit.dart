import 'package:bloc/bloc.dart';

import '../repo/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository repository;

  AuthCubit(this.repository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await repository.login(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> signup(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await repository.signup(email, password);
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void logout() {
    emit(AuthInitial());
  }
}
