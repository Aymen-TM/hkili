import 'package:hkili/data/models/user_model.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  bool loading;
  AuthLoading({required this.loading});
}

class Authenticated extends AuthState {
  final UserModel? user;
  const Authenticated(this.user);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Authenticated && o.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}

class NotAuthenticated extends AuthState {
  const NotAuthenticated();
}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AuthError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class PasswordRequestSubmitted extends AuthState {
  const PasswordRequestSubmitted();
}

class FirstRun extends AuthState {
  const FirstRun();
}

class PersonalDataUpdated extends AuthState {
  const PersonalDataUpdated();
}
