import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hkili/BL/cubit/auth_state.dart';
import 'package:hkili/constants.dart';
import 'package:hkili/data/models/user_model.dart';
import 'package:hkili/data/repository/auth_repository.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());

  UserModel? currentUser() {
    return _authRepository.currentUser();
  }

  Future login(String email, String password) async {
    try {
      emit(AuthLoading(loading: false));
      await _authRepository.login(email, password);
      UserModel? currentUser = _authRepository.currentUser();
      if (currentUser != null) {
        emit(Authenticated(currentUser));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future loginWithGoogle() async {
    try {
      emit(AuthLoading(loading: false));
      await _authRepository.signInWithGoogle();
      UserModel? currentUser = _authRepository.currentUser();
      if (currentUser != null) {
        emit(Authenticated(currentUser));
        AuthLoading(loading: true);
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future register(String email, String password) async {
    try {
      emit(AuthLoading(loading: false));
      await _authRepository.register(email, password);
      UserModel? currentUser = _authRepository.currentUser();
      emit(Authenticated(currentUser));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future logout() async {
    try {
      await _authRepository.logout();
      await googleSign.signOut();
      emit(NotAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future submitPasswordReset(String email) async {
    try {
      emit(AuthLoading(loading: false));
      await _authRepository.passwordResetSubmit(email);
      emit(PasswordRequestSubmitted());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void isLoggedIn() {
    try {
      if (_authRepository.currentUser() != null) {
        UserModel? currentUser = _authRepository.currentUser();
        emit(Authenticated(currentUser));
      } else {
        emit(NotAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future isFirstRun() async {
    try {
      emit(AuthLoading(loading: false));
      if (await _authRepository.isFirstRun()) {
        emit(FirstRun());
      } else {
        UserModel? currentUser = _authRepository.currentUser();
        emit(Authenticated(currentUser));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future updatePersonalData(
      String firstName, String lastName, String birthday) async {
    try {
      emit(AuthLoading(loading: false));
      await _authRepository.updatePersonalData(firstName, lastName, birthday);
      emit(PersonalDataUpdated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
