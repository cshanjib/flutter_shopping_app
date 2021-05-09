part of 'auth_token_cubit.dart';

@immutable
class AuthTokenState extends Equatable {
  final UserAuth auth;
  final String error;

  final bool isLoggedIn;

  bool get hasError => error != null && error.isNotEmpty;

  const AuthTokenState({this.error, this.auth, this.isLoggedIn});

  @override
  List<Object> get props => [error, isLoggedIn, auth];

  factory AuthTokenState.initial() {
    return AuthTokenState(error: "", isLoggedIn: false);
  }

  AuthTokenState update({bool isLoggedIn, UserAuth auth, error}) {
    return AuthTokenState(
      auth: auth ?? this.auth,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      error: error ?? "",
    );
  }

  @override
  String toString() =>
      'AuthTokenState { auth: $auth, error: $error, isLoggedIn: $isLoggedIn }';
}
